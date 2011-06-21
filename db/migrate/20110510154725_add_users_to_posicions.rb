class AddUsersToPosicions < ActiveRecord::Migration
  def self.up
    add_column :posicions, :created_by, :integer
    add_column :posicions, :updated_by, :integer
  end

  def self.down
    remove_column :posicions, :updated_by
    remove_column :posicions, :created_by
  end
end
