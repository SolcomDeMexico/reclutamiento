# encoding: UTF-8
class Requerimiento < ActiveRecord::Base
  belongs_to :area
  belongs_to :posicion
  has_one :vacante
  validates_presence_of :nombre, :message => "El nombre del requerimiento es requerido."
  validates_presence_of :area_id, :message => "El área que solicita el requerimiento es requerida."
  validates_associated :area , :message => "El área que solicita debe ser un área funcional válida."
  validates_associated :posicion , :message => "La posición relacionada  debe ser una posición válida."
  validates_presence_of :fecha_contratacion_deseada, :message => "La fecha de contratación deseada es requerida."
  validates_presence_of :descripcion , :message => "La descripción del requerimiento es requerida." 
  validates_presence_of :responsabilidades , :message => "Las responsabilidades del requerimiento son requeridas."
  validates_presence_of :habilidades , :message => "Las habilidades necesarias del requerimiento son requeridas."
  validates_presence_of :competencias , :message => "Las competencias necesarias del requerimiento son requeridas."
  validates_presence_of :pago_minimo , :message => "El pago mínimo del requerimiento es requerido."
  validates_presence_of :pago_maximo , :message => "El pago máximo del requerimiento es requerido."
  validates_numericality_of :pago_minimo , :message => "El pago mínimo del requerimiento debe ser un valor numérico."
  validates_numericality_of :pago_maximo , :message => "El pago máximo del requerimiento debe ser un valor numérico."
  validates_presence_of :tipo , :message => "El tipo del requerimiento es requerido."
  validates_presence_of :estatus , :message => "El estatus del requerimiento es requerido."

  validates :fecha_contratacion_deseada, :date => {:after_or_equal_to => Time.now, :message => "No se puede ingresar una fecha anterior a la de hoy." }

  def posicion_name
		posicion.nombre if posicion
	end
		
	def posicion_name=(nombre)
		self.posicion = Posicion.find_by_nombre(nombre) unless nombre.blank?
	end
    
end
