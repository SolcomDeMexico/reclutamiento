class AddLugarToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :lugar, :string
  end

  def self.down
    remove_column :areas, :lugar
  end
end
