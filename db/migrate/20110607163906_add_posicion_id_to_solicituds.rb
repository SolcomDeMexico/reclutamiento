class AddPosicionIdToSolicituds < ActiveRecord::Migration
  def self.up
    add_column :solicituds, :posicion_id, :integer
  end

  def self.down
    remove_column :solicituds, :posicion_id
  end
end
