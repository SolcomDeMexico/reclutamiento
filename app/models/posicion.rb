# encoding: UTF-8
class Posicion < ActiveRecord::Base  
  has_many :vacantes
  has_many :requerimientos
  belongs_to :area
  validates_presence_of :nombre, :message => "El nombre de la posición es requerido."
  validates_presence_of :area, :message => "El nombre de la área es requerido."
  validates_associated :area, :message => "Debes ingresar una área existente."
  
end
