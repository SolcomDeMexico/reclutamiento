class CreatePosicions < ActiveRecord::Migration
  def self.up
    create_table :posicions do |t|
      t.string :nombre
      t.string :area_funcional
      t.string :descripcion
      t.string :habilidades_necesarias
      t.string :responsabilidades
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :posicions
  end
end
