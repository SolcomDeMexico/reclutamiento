class PosicionsController < ApplicationController
  
    before_filter :authenticate
    filter_resource_access 
  
  def index
    @posicions = Posicion.find(:all, :conditions => ['nombre ILIKE ?',"%#{params[:term]}%"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posicions }
      format.js
    end
  end

  def show
  @posicion = Posicion.find(params[:id])
  @usuario_crea = Usuario.find(@posicion.created_by)
  @usuario_actualiza = Usuario.find(@posicion.updated_by)
  
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @posicion }
    end
  end

  
  def new
	@nuevo = true
  @posicion = Posicion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @posicion }
    end
  end

  # GET /entrevista/1/edit
  def edit
	@nuevo = false
    @posicion = Posicion.find(params[:id])
  end
    
  
  def create
    @nuevo = true
    @posicion= Posicion.new(params[:posicion])    
    @posicion.created_by = current_user.id
    @posicion.updated_by = current_user.id
    

    respond_to do |format|
      if @posicion.save
        format.html { redirect_to(@posicion, :notice => 'La posición fue creada exitosamente.') }
        format.xml  { render :xml => @posicion, :status => :created, :location => @posicion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @posicion.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @posicion = Posicion.find(params[:id])
        @posicion.updated_by = current_user.id
                

    respond_to do |format|
      if @posicion.update_attributes(params[:posicion])
        format.html { redirect_to(@posicion, :notice => 'La posición fue actualizada exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @posicion.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @posicion= Posicion.find(params[:id])
    @posicion.destroy

    respond_to do |format|
      format.html { redirect_to(entrevista_url) }
      format.xml  { head :ok }
    end
  end
  
end
