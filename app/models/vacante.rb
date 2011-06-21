class Vacante < ActiveRecord::Base
  has_many :solicituds, :dependent => :destroy
	#has_many :entrevistum, :through => :solicitud
  has_many :candidatos, :through => :solicituds
  belongs_to :area
  belongs_to :requerimiento
  belongs_to :posicion
  
  validates_presence_of :nombre, :message => "El nombre de la vacante es requerido."
  validates_presence_of :area_id, :message => "El área que solicita la vacante es requerida."
  validates_associated :area , :message => "El área que solicita debe ser un área funcional válida."
  validates_presence_of :fecha_deseada_contratacion, :message => "La fecha de contratación deseada es requerida."
  validates_presence_of :descripcion , :message => "La descripción de la vacante es requerida." 
  validates_presence_of :responsabilidades , :message => "Las responsabilidades de la vacante son requeridas."
  validates_presence_of :habilidades , :message => "Las habilidades necesarias de la vacante son requeridas."
  validates_presence_of :competencias , :message => "Las competencias necesarias de la vacante son requeridas."
  validates_presence_of :pago_minimo , :message => "El pago mínimo de la vacante es requerido."
  validates_presence_of :pago_maximo , :message => "El pago máximo de la vacante es requerido."
  validates_numericality_of :pago_minimo , :message => "El pago mínimo de la vacante debe ser un valor numérico."
  validates_numericality_of :pago_maximo , :message => "El pago máximo de la vacante debe ser un valor numérico."
  validates_presence_of :tipo , :message => "El tipo de la vacante es requerido."
  
   def posicion_name
		posicion.nombre if posicion
	end
		
	def posicion_name=(nombre)
		self.posicion = Posicion.find_by_nombre(nombre) unless nombre.blank?
	end
    
end