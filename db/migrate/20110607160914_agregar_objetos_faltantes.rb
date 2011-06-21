class AgregarObjetosFaltantes < ActiveRecord::Migration
  def self.up
    rename_column :solicituds, :posicion_id, :vacante_id
    add_column :entrevista, :estatus, :string
    add_column :usuarios, :updated_by, :integer
    
    create_table :vacantes do |t|
      t.string :nombre
      t.string :tipo
      t.boolean :requiere_viajar
      t.text :descripcion
      t.text :habilidades
      t.text :competencias
      t.text :responsabilidades
      t.string :estudios
      t.integer :requerimiento_id
      t.date :fecha_inicio_reclutamiento
      t.date :fecha_deseada_contratacion
      t.date :fecha_cierre_reclutamiento
      t.integer :pago_minimo
      t.integer :pago_maximo
      t.integer :created_by
      t.integer :updated_by 
      t.integer :area_id
      t.timestamps
    end
    
    create_table :requerimientos do |t|
      t.string :nombre
      t.string :tipo
      t.text :descripcion
      t.text :habilidades
      t.text :competencias
      t.text :responsabilidades
      t.string :estudios
      t.date :fecha_contratacion_deseada
      t.integer :pago_minimo
      t.integer :pago_maximo
      t.integer :created_by
      t.integer :updated_by 
      t.integer :area_id
      t.timestamps
    end
    
    
  end

  def self.down
  end
end
