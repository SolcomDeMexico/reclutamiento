# encoding: UTF-8
class RequerimientosController < ApplicationController  
  include RequerimientosHelper
  before_filter :authenticate
  filter_resource_access 
  
  def index    
    @requerimientos = Requerimiento.find(:all)
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @requerimientos }
      format.js
    end
  end
  
  def show
    @requerimiento = Requerimiento.find(params[:id])
      	@usuario_crea = Usuario.find(@requerimiento.created_by)
  	@usuario_actualiza = Usuario.find(@requerimiento.updated_by)
	
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @requerimiento }
    end
  end
  
  def new
	  @nuevo = true
    @requerimiento = Requerimiento.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @requerimiento }
    end
  end

  def edit
	  @nuevo = false
    @requerimiento = Requerimiento.find(params[:id])
  end

  def create
    @nuevo = true
    @requerimiento = Requerimiento.new(params[:requerimiento])
    @requerimiento.created_by = current_user.id
    @requerimiento.updated_by = current_user.id
    @requerimiento.estatus = "En aprobación"
    if @requerimiento.posicion.nil?
      if @requerimiento.area.nil?
        @requerimiento.area = Area.find(Departamento.find(current_user.departamento_id).area_id)
      end
    else
      @requerimiento.area = Area.find(@requerimiento.posicion.area_id)
    end

    
    respond_to do |format|
      if @requerimiento.save
        format.html { redirect_to(@requerimiento, :notice => 'El requerimiento fue creado exitosamente.') }
        format.xml  { render :xml => @requerimiento, :status => :created, :location => @requerimiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @requerimiento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @requerimiento = Requerimiento.find(params[:id])
    @requerimiento.updated_by = current_user.id
    

    respond_to do |format|
      if @requerimiento.update_attributes(params[:requerimiento])
        if @requerimiento.estatus != 'Convertido en Vacante'
          format.html { redirect_to(@requerimiento, :notice => 'El requerimiento fue actualizado exitosamente.') }
          format.xml  { head :ok }
        else
          format.html { redirect_to(:action => "convertir_vacante", :id => @requerimiento.id ) }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requerimiento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def aprobar
    action("Aprobado por Gerente de Área")    
  end  
  
  def rechazar
    action("Rechazado por Gerente de Área")
  end

  def rechazar_rh
    action("Rechazado por Recursos Humanos")
  end

  def convertir
    action("Convertido en Vacante")
  end

  def convertir_vacante
    requerimiento = Requerimiento.find(params[:id])
    vacante = Vacante.new()
    vacante.nombre = requerimiento.nombre
    vacante.tipo = requerimiento.tipo
    vacante.requiere_viajar = requerimiento.requiere_viajar
    vacante.descripcion = requerimiento.descripcion
    vacante.habilidades = requerimiento.habilidades 
    vacante.competencias = requerimiento.competencias
    vacante.responsabilidades = requerimiento.responsabilidades
    vacante.estudios = requerimiento.estudios
    vacante.requerimiento_id = requerimiento.id
    vacante.fecha_inicio_reclutamiento = Date.today
    vacante.fecha_deseada_contratacion = requerimiento.fecha_contratacion_deseada
    vacante.pago_minimo = requerimiento.pago_minimo
    vacante.pago_maximo = requerimiento.pago_maximo
    vacante.created_by = current_user.id
    vacante.updated_by = current_user.id
    vacante.area_id = requerimiento.area_id
    vacante.estatus = 'Abierta'
    vacante.posicion_id = requerimiento.posicion_id
    vacante.save!
    redirect_to (vacante, :notice => 'La vacante fue creada exitosamente')

  end

  def cancelar
    @requerimiento = Requerimiento.find(params[:id])
    @requerimiento.update_attributes(:estatus => 'Cancelado por Solicitante')
    @requerimiento.updated_by = current_user.id
    @requerimiento.save!
    redirect_to(requerimientos_path, :notice => 'El requerimiento fue cancelado exitosamente.') 
  end

  def destroy
    @requerimiento = Requerimiento.find(params[:id])
    @requerimiento.destroy

    respond_to do |format|
      format.html { redirect_to(requerimientos_url) }
      format.xml  { head :ok }
    end
  end
  
 
end
