class AddUsuariosToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :created_by, :integer
    add_column :areas, :updated_by, :integer
  end

  def self.down
    remove_column :areas, :updated_by
    remove_column :areas, :created_by
  end
end
