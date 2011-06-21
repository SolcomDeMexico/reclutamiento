class AddCamposToEntrevista < ActiveRecord::Migration
  def self.up
    add_column :entrevista, :usuario_id , :integer
    add_column :entrevista, :calificacion, :integer
    add_column :entrevista, :ubicacion, :string
    
  end

  def self.down
    remove_column :entrevista, :entrevistador
    remove_column :entrevista, :usuario_id
    remove_column :entrevista, :ubicacion
  end
end
