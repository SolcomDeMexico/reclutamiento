module SesionHelper
  
  
	def sign_in(usuario)
		cookies.signed[:remember_token] = [usuario.id,usuario.salt]
		self.current_user = usuario
	end
	
	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def signed_in?
		!current_user.nil?
	end
  
	def current_user=(usuario)
		@current_user = usuario
	end
	
	def current_user
		@current_user ||= user_from_remember_token
  end  
	
	def authenticate
		deny_access unless signed_in?
	end
    
	def deny_access
		store_location
		redirect_to root_path, :notice => "Por favor entra con tus credenciales de SOLCOM"
	end
	
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		clear_return_to
	end
  
    def calcularHora(hora)
    if !current_user.zona_horaria.nil?
      nuevaHora = hora + diferenciaHoras
    else
      hora
    end
  end
  
  def calcularHoraInversa(hora)
    if !current_user.zona_horaria.nil?
      nuevaHora = hora + (diferenciaHoras*-1)
    else
      hora
    end
  end
  
  def diferenciaHoras
   dif = (current_user.zona_horaria/3600000) + 1
  end
  
  def cambiarFecha(fecha)    
    hora = calcularHoraInversa(fecha.hour)
    DateTime.new(fecha.year,fecha.month,fecha.day,hora,fecha.min,0,0)
  end

  def meses
    meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
  end
  
	private 
	
	def store_location
		session[:return_to] = request.fullpath
	end
  
	def clear_return_to
		session[:return_to] = nil
	end
  
	def user_from_remember_token
		Usuario.authenticate_with_salt(*remember_token)
	end
  
	def remember_token
		cookies.signed[:remember_token] || [nil,nil]
	end
  
	def current_user?(usuario)
		usuario == current_user
	end
	  

end
