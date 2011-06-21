class AddHabilidadesOpcionalesToPosicions < ActiveRecord::Migration
  def self.up
    add_column :posicions, :habilidades_opcionales, :string
  end

  def self.down
    remove_column :posicions, :habilidades_opcionales
  end
end
