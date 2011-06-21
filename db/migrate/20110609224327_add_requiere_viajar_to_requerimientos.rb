class AddRequiereViajarToRequerimientos < ActiveRecord::Migration
  def self.up
    add_column :requerimientos, :requiere_viajar, :boolean
  end

  def self.down
    remove_column :requerimientos, :requiere_viajar
  end
end
