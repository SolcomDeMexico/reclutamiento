class AddUsuarioIdToVacantes < ActiveRecord::Migration
  def self.up
    add_column :vacantes, :usuario_id, :integer
  end

  def self.down
    remove_column :vacantes, :usuario_id
  end
end
