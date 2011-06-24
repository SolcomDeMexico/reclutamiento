# encoding: UTF-8
class CandidatosController < ApplicationController
  # GET /candidatos
  # GET /candidatos.xml
  before_filter :authenticate
  filter_resource_access 
  def index
  
    #@candidatos = Candidato.all
		@candidatos = Candidato.find(:all, :conditions => ['nombre ILIKE ?',"%#{params[:term]}%"])


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @candidatos }
	    format.js
    end
  end

  # GET /candidatos/1
  # GET /candidatos/1.xml
  def show
    @candidato = Candidato.find(params[:id])  
      	@usuario_crea = Usuario.find(@candidato.created_by)
  	@usuario_actualiza = Usuario.find(@candidato.updated_by)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @candidato }
    end
  end

  # GET /candidatos/new
  # GET /candidatos/new.xml
  def new
	@nuevo = true
  @candidato = Candidato.new
	@candidatos = Candidato.find(:all, :conditions => ['nombre LIKE ?',"%#{params[:search]}%"])


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidato }
	  format.js
    end
  end

  # GET /candidatos/1/edit
  def edit
	@nuevo = false
    @candidato = Candidato.find(params[:id])
  end

  # POST /candidatos
  # POST /candidatos.xml
  def create
    @id = current_user.id
    @nuevo = true    
    @candidato = Candidato.new(params[:candidato])  
    @candidato.created_by = current_user.id
    @candidato.updated_by = current_user.id
	 #@candidatos = Candidato.find(:all, :conditions => ['nombre LIKE ?',"%#{params[:search]}%"])

	
    respond_to do |format|
      if @candidato.save
        format.html { redirect_to(@candidato, :notice => 'Candidato fue creado exitosamente.') }
        format.xml  { render :xml => @candidato, :status => :created, :location => @candidato }
		format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidato.errors, :status => :unprocessable_entity }
		format.js
      end
    end
  end

  # PUT /candidatos/1
  # PUT /candidatos/1.xml
  def update
    @candidato = Candidato.find(params[:id])    
    @candidato.updated_by = current_user.id

    respond_to do |format|
      if @candidato.update_attributes(params[:candidato])
        format.html { redirect_to(@candidato, :notice => 'Candidato fue actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatos/1
  # DELETE /candidatos/1.xml
  def destroy
    @candidato = Candidato.find(params[:id])
    @candidato.destroy

    respond_to do |format|
      format.html { redirect_to(candidatos_url) }
      format.xml  { head :ok }
    end
  end

end
