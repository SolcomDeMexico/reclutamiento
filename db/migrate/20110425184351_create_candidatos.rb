class CreateCandidatos < ActiveRecord::Migration
  def self.up
    create_table :candidatos do |t|
      t.string :nombre
      t.string :email
      t.string :carrera
      t.string :escuela
      t.string :domicilio
      t.string :ciudad
      t.string :estado
      t.integer :telefono
      t.integer :celular
      t.string :proyectos
      t.boolean :empleado_actualmente
      t.integer :experiencia
      t.string :empresa_actual

      t.timestamps
    end
  end

  def self.down
    drop_table :candidatos
  end
end
