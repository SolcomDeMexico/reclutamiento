class Departamento < ActiveRecord::Base
  belongs_to :area
  has_many :usuarios, :dependent => :destroy
  belongs_to :usuario
  validates_presence_of :nombre, :message => "El nombre del departamento es requerido."
    validates_presence_of :usuario, :message => "El jefe del departamento es requerido."
  validates_associated :usuario, :message => "Debes ingresar un empleado existente."

  
    
  def jefe_name
  usuario.display_name if usuario
  end
  
  def jefe_name=(nombre)
    self.usuario = Usuario.find_by_display_name(nombre) unless nombre.blank?
  end
end
