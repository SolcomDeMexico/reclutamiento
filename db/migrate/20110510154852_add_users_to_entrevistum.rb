class AddUsersToEntrevistum < ActiveRecord::Migration
  def self.up
    add_column :entrevista, :created_by, :integer
    add_column :entrevista, :updated_by, :integer
  end

  def self.down
    remove_column :entrevista, :updated_by
    remove_column :entrevista, :created_by
  end
end
