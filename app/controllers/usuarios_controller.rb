# encoding: UTF-8
class UsuariosController < ApplicationController
  include UsuariosHelper
  before_filter :authenticate
  filter_resource_access 
  
  def index
    condicion = AUTOCOMPLETE_CONDITION_USERS
    @usuarios = Usuario.find(:all, :conditions => [condicion,"%#{params[:search]}%"])
    
    respond_to do |format|
      format.html 
      format.xml { render :xml => @usuarios}
      format.js
    end
    
  end
  
  def show
    @usuario = Usuario.find(params[:id])
    @usuario_actualiza = Usuario.find(@usuario.updated_by)
    @departamento = Departamento.find(@usuario.departamento_id) if !@usuario.departamento_id.nil?
    cambiar_roles_inverso(@usuario.role,@usuario.perfil)
    @usuario.role = @rolInverso
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end
  end
  
  def edit
      @usuario = Usuario.find(params[:id])
      cambiar_roles_inverso(@usuario.role,@usuario.perfil)
      @usuario.role = @rolInverso
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuario }      
    end
    
  end
    
  def asignar_roles
  end
    
  
  def update  
      @usuario = Usuario.find(params[:id])
      cambiar_roles(params[:usuario][:role],params[:usuario][:perfil])            
      @usuario.updated_by = current_user.id
      params[:usuario][:role]=@rol
    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to(@usuario, :notice => 'Usuario fue actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
  

end
