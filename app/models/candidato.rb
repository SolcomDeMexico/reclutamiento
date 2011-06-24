# encoding: UTF-8
require 'paperclip'
class Candidato < ActiveRecord::Base
  ACCESS_KEY_ID = 'AKIAJ2XF5PYCBBFAWI3Q'
  SECRET_ACCESS_KEY = '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'
  BUCKET = 'curriculums_reclutamiento'
  has_many :solicituds, :dependent => :destroy	
  has_many :entrevistum, :through => :solicitud
  has_many :vacantes, :through => :solicituds
  has_one :area, :through => :vacantes
  
	validates_presence_of :nombre, :message => "El nombre del candidato es requerido."
  validates_presence_of :fecha_nacimiento, :message => "La fecha de nacimiento del candidato es requerida."
  validates_presence_of :email, :message => "El email del candidato es requerido."
  validates_presence_of :carrera, :message => "La carrera del candidato es requerida."
  validates_presence_of :domicilio, :message => "El domicilio del candidato es requerido."
  validates_presence_of :areas_interes, :message => "Las áreas de interés del candidato son requeridas."
  validates_presence_of :sueldo_deseado, :message => "El sueldo mensual deseado del candidato es requerido."
  validates_numericality_of :sueldo_deseado, :message => "El sueldo mensual deseado debe ser numérico"
	validates_numericality_of :telefono,:allow_blank => true, :message => "El teléfono debe ser numérico."
  validates_numericality_of :celular, :allow_blank => true, :message => "El teléfono celular debe ser numérico."

  
  has_attached_file :curriculum,
  :storage => 's3',
  :bucket => BUCKET,
  :path => ":attachment/:id/:style/:basename.:extension",
  :s3_credentials => { :access_key_id => ACCESS_KEY_ID, :secret_access_key => SECRET_ACCESS_KEY },
  :s3_permissions => 'public-read'
    
  validates_attachment_size :curriculum, :less_than => 10.megabytes, :message => "El curriculum no debe exceder los 10MB."
  validates_attachment_content_type :curriculum , :content_type => ['application/pdf','application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document'] , 
  :message => "El curriculum debe estar en formato Microsoft Word ó PDF."
end
