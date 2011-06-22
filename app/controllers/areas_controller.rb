# encoding: UTF-8
class AreasController < ApplicationController
  
    before_filter :authenticate
    filter_resource_access 
  
  def index
    @areas = Area.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @areas }
    end
  end

  def show
  @area = Area.find(params[:id])
  @usuario_crea = Usuario.find(@area.created_by)
  @usuario_actualiza = Usuario.find(@area.updated_by)
  
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @area }
    end
  end

  
  def new
	@nuevo = true
  @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @area }
    end
  end

  # GET /entrevista/1/edit
  def edit
	@nuevo = false
    @area = Area.find(params[:id])
  end
    
  
  def create
    @nuevo = true
    @area= Area.new(params[:area])    
    @area.created_by = current_user.id
    @area.updated_by = current_user.id
    

    respond_to do |format|
      if @area.save
        format.html { redirect_to(@area, :notice => 'La área fue creada exitosamente.') }
        format.xml  { render :xml => @area, :status => :created, :location => @area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @area = Area.find(params[:id])
        @area.updated_by = current_user.id
                

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to(@area, :notice => 'La área fue actualizada exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @area= Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to(entrevista_url) }
      format.xml  { head :ok }
    end
  end
  
end
