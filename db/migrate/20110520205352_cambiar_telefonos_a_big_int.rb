class CambiarTelefonosABigInt < ActiveRecord::Migration
  def self.up
    remove_column :candidatos, :telefono
    remove_column :candidatos, :celular
    remove_column :candidatos, :ref_telefono
    add_column :candidatos,:telefono, :integer, :limit => 8
    add_column :candidatos,:celular, :integer, :limit => 8
    add_column :candidatos, :ref_telefono, :integer, :limit => 8
    
  end

  def self.down
    remove_column :candidatos, :telefono
    remove_column :candidatos, :celular
    remove_column :candidatos,:ref_telefono
    add_column :candidatos,:telefono, :integer
    add_column :candidatos,:celular, :integer
    add_column :candidatos,:ref_telefono,:integer
  end
end
