# encoding: UTF-8
class VacantesController < ApplicationController
  include VacantesHelper
  before_filter :authenticate
  filter_resource_access :additional_collection => :autocomplete_posicion_nombre
  autocomplete :posicion, :nombre, :full => :true
  
  def index
	@vacantes = Vacante.find(:all)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @vacantes }
	    format.js 
    end
  end

  
  def show
    @vacante = Vacante.find(params[:id])
  	@usuario_crea = Usuario.find(@vacante.created_by)
  	@usuario_actualiza = Usuario.find(@vacante.updated_by)
    
    if !@vacante.usuario_id.nil?
      @contratado =  Usuario.find(@vacante.usuario_id)
    end
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @vacante }
    end
  end
  
  def cerrar
    @vacante = Vacante.find(params[:id])    
  end
  
  def new
	  @nuevo = true
    @vacante = Vacante.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vacante }
    end
  end
  def edit
	  @nuevo = false
    @vacante = Vacante.find(params[:id])
  end
  
  
  def create
    @nuevo = true
    @vacante = Vacante.new(params[:vacante])
    @vacante.created_by = current_user.id
    @vacante.updated_by = current_user.id
    @vacante.estatus = 'Abierta'
    @vacante.fecha_inicio_reclutamiento = Date.today
    if !@vacante.posicion_id.nil?
      @vacante.area_id = @vacante.posicion.area_id
    end

    respond_to do |format|
      if @vacante.save
        format.html { redirect_to(@vacante, :notice => 'La vacante fue creada exitosamente.') }
        format.xml  { render :xml => @vacante, :status => :created, :location => @vacante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vacante.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @vacante = Vacante.find(params[:id])
    @vacante.updated_by = current_user.id
    
      
    respond_to do |format|
      if @vacante.update_attributes(params[:vacante])
        if @vacante.estatus == 'Cerrada'
          cambiar_estado_solicitudes(@vacante.id,@vacante.usuario_id)
        end
        format.html { redirect_to(@vacante, :notice => 'La vacante fue actualizada exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vacante.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @vacante = Vacante.find(params[:id])
    @vacante.destroy

    respond_to do |format|
      format.html { redirect_to(vacantes_url) }
      format.xml  { head :ok }
    end
  end
  
 
end
