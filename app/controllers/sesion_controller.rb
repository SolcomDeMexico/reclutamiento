class SesionController < ApplicationController

before_filter :authenticate, :only => :home

	def home
    @title='Reclutamiento | Home'		    
	end
	
	def create
		access_token = client.web_server.get_access_token(params[:code], :redirect_uri => "https://localhost:3000/oauth/callback", :grant_type => 'authorization_code')
		id = access_token['id'][28,41]
		user = JSON.parse(access_token.get("#{INSTANCE_URL}#{id}"))
		user_id = user['user_id']
		usuario = Usuario.find_by_user_id(user_id)
		if usuario.nil?
		email = user['email']
		picture = user['photos']['picture']
		nombre = user['display_name'] 
    horario = user['utcOffset']
		usuario = Usuario.new(:user_id => user_id, :email => email, :picture => picture, :display_name => nombre, 
                          :zona_horaria => horario) 
		usuario.save
    usuario.updated_by = usuario.id
    usuario.save
		usuario = Usuario.find_by_user_id(user_id)
    rol = Role.find_by_nombre("empleado")
    asignacion = RolAsignacion.new(:usuario_id => usuario.id , :role_id => rol.id )
    asignacion.save
		end 
		sign_in usuario
		redirect_to  :action => 'home'
	end
		
  def destroy 
		sign_out
		redirect_to root_path
	end
  
	def login
		redirect_to client.web_server.authorize_url(
		:response_type => 'code',
		:redirect_uri => "https://localhost:3000/oauth/callback",
		:parse_json => true
		)
	end
end
