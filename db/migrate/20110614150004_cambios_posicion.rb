class CambiosPosicion < ActiveRecord::Migration
  def self.up
    remove_column :posicions, :area_funcional
    remove_column :posicions, :descripcion
    remove_column :posicions, :habilidades_necesarias
    remove_column :posicions, :responsabilidades
    remove_column :posicions, :tipo
    remove_column :posicions, :habilidades_opcionales
    add_column :posicions, :area_id, :integer
    add_column :requerimientos, :posicion_id , :integer
    add_column :vacantes, :posicion_id , :integer
    remove_column :solicituds, :posicion_id
  end

  def self.down
    add_column :posicions, :area_funcional , :string
    add_column :posicions, :descripcion , :string
    add_column :posicions, :habilidades_necesarias, :string
    add_column :posicions, :responsabilidades, :string
    add_column :posicions, :tipo, :string
    add_column :posicions, :habilidades_opcionales, :string
    remove_column :posicions, :area_id
    remove_column :requerimientos, :posicion_id 
    remove_column :vacantes, :posicion_id 
    add_column :solicituds, :posicion_id, :integer
  end
end
