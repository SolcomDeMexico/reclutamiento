class AddEstatusToRequerimientos < ActiveRecord::Migration
  def self.up
    add_column :requerimientos, :estatus, :string
  end

  def self.down
    remove_column :requerimientos, :estatus
  end
end
