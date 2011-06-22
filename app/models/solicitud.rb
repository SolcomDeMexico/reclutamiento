# encoding: UTF-8
class Solicitud < ActiveRecord::Base
	belongs_to :vacante
	belongs_to :candidato
	has_many :entrevistum, :dependent => :destroy
	validates_presence_of :vacante, :message => "El campo vacante es requerido."
  validates_presence_of :candidato, :message => "El campo candidato es requerido."
	validates_associated :vacante, :message => "Debes ingresar una vacante existente."
  validates_associated :candidato, :message => "Debes ingresar un candidato existente."
  before_save :agrega_nombre
  
	
	def vacante_name
		vacante.nombre if vacante
	end
	
	def vacante_name=(nombre)
		self.vacante = Vacante.find_by_nombre(nombre) unless nombre.blank?
	end
	
	def candidato_name
		candidato.nombre if candidato
	end
		
	def candidato_name=(nombre)
		self.candidato = Candidato.find_by_nombre(nombre) unless nombre.blank?
	end

private 

  
  def agrega_nombre
    pos = Vacante.find(self.vacante_id)
    can = Candidato.find(self.candidato_id) 
    self.nombre = "#{pos.nombre} - #{can.nombre}"
  end
	
end
