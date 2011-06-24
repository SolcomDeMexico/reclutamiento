class DropTableRoles < ActiveRecord::Migration
  def self.up
    drop_table :roles
    drop_table :rol_asignacions
  end

  def self.down
    create_table :roles do |t|
      t.string :nombre
      t.timestamps
    end
    create_table :rol_asignacions do |t|
      t.integer :role_id
      t.integer :usuario_id
    end
  end
end
