class Area < ActiveRecord::Base  
  has_many :vacantes
  has_many :departamentos, :dependent => :destroy
  belongs_to :usuario
  validates_presence_of :nombre, :message => "El nombre de la área es requerido."
  validates_presence_of :usuario, :message => "El gerente de la área es requerido."
  validates_associated :usuario, :message => "Debes ingresar un empleado existente."

  
  

  
  def gerente_name
    usuario.display_name if usuario
  end
  
  def gerente_name=(nombre)
    self.usuario = Usuario.find_by_display_name(nombre) unless nombre.blank?
  end
  
end