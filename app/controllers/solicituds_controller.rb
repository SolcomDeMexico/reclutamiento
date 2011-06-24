# encoding: UTF-8
class SolicitudsController < ApplicationController
  # GET /solicituds
  # GET /solicituds.xml
 before_filter :authenticate
	filter_resource_access 

  def index
    @solicituds = Solicitud.find(:all, :conditions => ['nombre ILIKE ?',"%#{params[:search]}%"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicituds }
      format.js  
    end
  end

  # GET /solicituds/1
  # GET /solicituds/1.xml
  def show
    @solicitud = Solicitud.find(params[:id])
  	@usuario_crea = Usuario.find(@solicitud.created_by)
  	@usuario_actualiza = Usuario.find(@solicitud.updated_by)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solicitud }
    end
  end
  
  # GET /solicituds/new
  # GET /solicituds/new.xml
  def new
	@nuevo = true
  @solicitud = Solicitud.new      
    @solicituds = Solicitud.find(:all, :conditions => ['nombre LIKE ?',"%#{params[:search]}%"])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitud }
      format.js
    end
  end

  # GET /solicituds/1/edit
  def edit
	@nuevo = false
    @solicitud = Solicitud.find(params[:id])
  end

  # POST /solicituds
  # POST /solicituds.xml
  def create
    @nuevo = true
    @solicitud = Solicitud.new(params[:solicitud])
    @solicitud.created_by = current_user.id
    @solicitud.updated_by = current_user.id
    @solicitud.estado = "Nueva solicitud"
    @solicituds = Solicitud.find(:all, :conditions => ['nombre LIKE ?',"%#{params[:search]}%"])

    respond_to do |format|
      if @solicitud.save
        format.html { redirect_to(@solicitud, :notice => 'La solicitud fue creada exitosamente.') }
        format.xml  { render :xml => @solicitud, :status => :created, :location => @solicitud }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solicitud.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /solicituds/1
  # PUT /solicituds/1.xml
  def update            
    @solicitud = Solicitud.find(params[:id])
    @solicitud.updated_by = current_user.id
    respond_to do |format|
      if @solicitud.update_attributes(params[:solicitud])
        format.html { redirect_to(@solicitud, :notice => 'La solicitud fue actualizada exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.xml
  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy

    respond_to do |format|
      format.html { redirect_to(solicituds_url) }
      format.xml  { head :ok }
    end
  end
  
end
