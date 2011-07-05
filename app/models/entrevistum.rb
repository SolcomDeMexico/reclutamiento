# encoding: UTF-8
class Entrevistum < ActiveRecord::Base 
  include SesionHelper  
	belongs_to :solicitud
  has_one :vacante, :through => :solicitud
  has_one :area, :through => :vacante
  belongs_to :usuario      

  
	validates_presence_of :solicitud, :message => "El campo solicitud es requerido."
  validates_presence_of :fecha, :message => "Debes ingresar una fecha para la entrevista."
	validates_associated :solicitud, :message => "Debes ingresar una solicitud existente."
  validates_presence_of :ubicacion, :message => "Debes ingresar una ubicación para la entrevista."
  validates_presence_of :usuario, :message => "El campo entrevistador es requerido."
  validates_associated :usuario, :message => "Debes asignar un entrevistador válido."
  validates_numericality_of :calificacion, :message => "La calificación debe ser un número del 0 al 10", :allow_blank => true
  validates :fecha, :date => {:after_or_equal_to => Proc.new  {Time.now.utc + (((Authorization.current_user.zona_horaria/3600000)+1)*60*60)}, :message => "No se puede crear una entrevista en fecha y hora anteriores a la actual." }, :on => :create  
  
  
end