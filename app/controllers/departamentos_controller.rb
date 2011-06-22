# encoding: UTF-8
class DepartamentosController < ApplicationController
  
    before_filter :authenticate
    filter_resource_access 
  

  def show
  @departamento = Departamento.find(params[:id])
  @usuario_crea = Usuario.find(@departamento.created_by)
  @usuario_actualiza = Usuario.find(@departamento.updated_by)
  @jefe = Usuario.find(@departamento.usuario_id)
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @departamento }
    end
  end

  
  def new
	@nuevo = true
  @departamento = Departamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @departamento }
    end
  end

  # GET /entrevista/1/edit
  def edit
	@nuevo = false
    @departamento = Departamento.find(params[:id])
  end
    
  
  def create
    @nuevo = true
    @departamento= Departamento.new(params[:departamento])    
    @departamento.created_by = current_user.id
    @departamento.updated_by = current_user.id
    

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to(@departamento, :notice => 'El departamento fue creado exitosamente.') }
        format.xml  { render :xml => @departamento, :status => :created, :location => @departamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @departamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @departamento = Departamento.find(params[:id])
    @departamento.updated_by = current_user.id
                

    respond_to do |format|
      if @departamento.update_attributes(params[:departamento])
        format.html { redirect_to(@departamento, :notice => 'El departamento fue actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @departamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @departamento= Departamento.find(params[:id])
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to(areas_url) }
      format.xml  { head :ok }
    end
  end
  
end
