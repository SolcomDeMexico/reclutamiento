class AddEstatusToVacantes < ActiveRecord::Migration
  def self.up
    add_column :vacantes, :estatus, :string
  end

  def self.down
    remove_column :vacantes, :estatus
  end
end
