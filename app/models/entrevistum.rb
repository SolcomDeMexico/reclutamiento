# encoding: UTF-8
class Entrevistum < ActiveRecord::Base 
  include SesionHelper  
	belongs_to :solicitud
  belongs_to :usuario      

  
	validates_presence_of :solicitud, :message => "El campo solicitud es requerido."
  validates_presence_of :fecha, :message => "Debes ingresar una fecha para la entrevista."
	validates_associated :solicitud, :message => "Debes ingresar una solicitud existente."
  validates_presence_of :ubicacion, :message => "Debes ingresar una ubicación para la entrevista."
  validates_presence_of :usuario, :message => "El campo entrevistador es requerido."
  validates_associated :usuario, :message => "Debes asignar un entrevistador válido."
  validates :fecha, :date => {:after_or_equal_to => Proc.new  {Time.now.utc + (((Authorization.current_user.zona_horaria/3600000)+1)*60*60)}, :message => "No se puede crear una entrevista en fecha y hora anteriores a la actual." }  
  
  def solicitud_name
		solicitud.nombre if solicitud
	end
	
	def solicitud_name=(nombre)
		self.solicitud = Solicitud.find_by_nombre(nombre) unless nombre.blank?
	end
  
  def entrevistador_name
    usuario.display_name if usuario
  end
  
  def entrevistador_name=(nombre)
    self.usuario = Usuario.find_by_display_name(nombre) unless nombre.blank?
  end
  
  private 

  
  
end
