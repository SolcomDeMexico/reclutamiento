class AddNombreToSolicituds < ActiveRecord::Migration
  def self.up
    add_column :solicituds, :nombre, :string
  end

  def self.down
    remove_column :solicituds, :nombre
  end
end
