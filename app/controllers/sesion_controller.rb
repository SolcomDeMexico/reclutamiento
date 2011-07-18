# encoding: UTF-8
class SesionController < ApplicationController
#before_filter :authenticate, :only => :home
require 'Users'

  def home
    @title='Reclutamiento | Home'		 
    #@token = ENV['sfdc_token'].inspect
    #logger.debug "HOLA #{@token}"
	end

	def create
    #access_token = client.web_server.get_access_token(params[:code], :redirect_uri => RECLUTAMIENTO_PATH, :grant_type => 'authorization_code')
		ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']    
    render :text => request.env
    #id = request.env['omniauth.strategy'].inspect[1061,69]
    #user = Users.get_uri(id)    
    #user_id = user['user_id']    
		#usuario = Usuario.find_by_user_id(user_id)
    #if usuario.nil?
		#  email = user['email']
		#  picture = user['photos']['picture']
		#  nombre = user['display_name'] 
    #  horario = user['utcOffset']
		#  usuario = Usuario.new(:user_id => user_id, :email => email, :picture => picture, :display_name => nombre, 
    #                     :zona_horaria => horario, :role => "empleado") 
		#  usuario.save
    #  usuario.updated_by = usuario.id
    #  usuario.save
		#  usuario = Usuario.find_by_user_id(user_id)
    #end 
    #sign_in usuario    
		#redirect_to  :action => 'home'
  end

  def destroy 
		sign_out
		redirect_to root_path
  end
  
  def authenticate
    redirect_to '/auth/forcedotcom'
  end
  
  def login
	redirect_to client.web_server.authorize_url(
		:response_type => 'token',
		:redirect_uri => RECLUTAMIENTO_PATH,
    :parse_json => true    
		)
  end
end