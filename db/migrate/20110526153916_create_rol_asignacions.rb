class CreateRolAsignacions < ActiveRecord::Migration
  def self.up
    create_table :rol_asignacions do |t|
      t.integer :usuario_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rol_asignacions
  end
end
