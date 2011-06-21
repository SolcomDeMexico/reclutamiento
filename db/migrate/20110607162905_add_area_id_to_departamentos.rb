class AddAreaIdToDepartamentos < ActiveRecord::Migration
  def self.up
    add_column :departamentos, :area_id, :integer
  end

  def self.down
    remove_column :departamentos, :area_id
  end
end
