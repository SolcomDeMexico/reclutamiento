class AddTituloToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :titulo, :string
  end

  def self.down
    remove_column :roles, :titulo
  end
end
