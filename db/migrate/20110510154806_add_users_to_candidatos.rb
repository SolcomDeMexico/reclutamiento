class AddUsersToCandidatos < ActiveRecord::Migration
  def self.up
    add_column :candidatos, :created_by, :integer
    add_column :candidatos, :updated_by, :integer
  end

  def self.down
    remove_column :candidatos, :updated_by
    remove_column :candidatos, :created_by
  end
end
