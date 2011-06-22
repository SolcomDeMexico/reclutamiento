# encoding: UTF-8
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  include SesionHelper
  include TabsHelper
  before_filter { |c| Authorization.current_user = c.current_user}
  
  def permission_denied
    flash[:notice] = "Lo sentimos, no cuenta con el permiso necesario para acceder a esa página."
    redirect_to home_path
  end
end
