class AddUsuariosToDepartamentos < ActiveRecord::Migration
  def self.up
    add_column :departamentos, :created_by, :integer
    add_column :departamentos, :updated_by, :integer
  end

  def self.down
    remove_column :departamentos, :updated_by
    remove_column :departamentos, :created_by
  end
end
