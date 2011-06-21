class AddUsersToSolicituds < ActiveRecord::Migration
  def self.up
    add_column :solicituds, :created_by, :integer
    add_column :solicituds, :updated_by, :integer
  end

  def self.down
    remove_column :solicituds, :updated_by
    remove_column :solicituds, :created_by
  end
end
