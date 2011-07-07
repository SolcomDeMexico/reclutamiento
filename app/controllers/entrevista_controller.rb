# encoding: UTF-8
class EntrevistaController < ApplicationController
  # GET /entrevista
  # GET /entrevista.xml
  include EntrevistaHelper
  before_filter :authenticate
  filter_resource_access :additional_collection => [:autocomplete_solicitud_nombre,:autocomplete_usuario_display_name]
  autocomplete :solicitud, :nombre, :full => :true, :scopes => :nuevas
  autocomplete :usuario, :display_name, :full => :true
  
  def index
    @entrevista = Entrevistum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entrevista }
      format.js
    end
  end

  # GET /entrevista/1
  # GET /entrevista/1.xml
  def show
  @entrevistum = Entrevistum.find(params[:id])
    	@usuario_crea = Usuario.find(@entrevistum.created_by)
  	@usuario_actualiza = Usuario.find(@entrevistum.updated_by)
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entrevistum }
    end
  end

  # GET /entrevista/new
  # GET /entrevista/new.xml
  def new
	@nuevo = true
    @entrevistum = Entrevistum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entrevistum }
    end
  end

  # GET /entrevista/1/edit
  def edit
	@nuevo = false
    @entrevistum = Entrevistum.find(params[:id])
  end
  
  def cancelar
    @entrevistum = Entrevistum.find(params[:id])
    @entrevistum.update_attributes(:estatus => 'Cancelada', :updated_by => current_user.id)
    @entrevistum.save!
    redirect_to(entrevista_path, :notice => 'La entrevista fue cancelada exitosamente.') 

  end
  
  def calificar
    @entrevistum = Entrevistum.find(params[:id])    
  end
  # POST /entrevista
  # POST /entrevista.xml
  def create
    @nuevo = true
    @entrevistum = Entrevistum.new(params[:entrevistum])
    @entrevistum.estatus = 'Por realizarse'
    @entrevistum.created_by = current_user.id
    @entrevistum.updated_by = current_user.id
    @entrevistum.fecha = cambiarFecha(@entrevistum.fecha)
    
    respond_to do |format|
      if @entrevistum.save
        solicitud = Solicitud.find(@entrevistum.solicitud_id)
        solicitud.estado = "Entrevista Agendada"
        solicitud.save!
        format.html { redirect_to(@entrevistum, :notice => 'La entrevista fue creada exitosamente.') }
        format.xml  { render :xml => @entrevistum, :status => :created, :location => @entrevistum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entrevistum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entrevista/1
  # PUT /entrevista/1.xml
  def update
    @entrevistum = Entrevistum.find(params[:id])
    @entrevistum.updated_by = current_user.id    
        
    if !params[:entrevistum][:calificacion].nil?
      @entrevistum.estatus = 'Realizada'
    end
    
    respond_to do |format|
      if @entrevistum.update_attributes(params[:entrevistum])
        format.html { redirect_to(@entrevistum, :notice => 'La entrevista fue actualizada exitosamente.') }
        format.xml  { head :ok }
      else
        if params[:status] == 'calificar'
          logger.debug "ALGO"
          format.html { render :action => "calificar" }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @entrevistum.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /entrevista/1
  # DELETE /entrevista/1.xml
  def destroy
    @entrevistum = Entrevistum.find(params[:id])
    @entrevistum.destroy

    respond_to do |format|
      format.html { redirect_to(entrevista_url) }
      format.xml  { head :ok }
    end
  end
  
end
