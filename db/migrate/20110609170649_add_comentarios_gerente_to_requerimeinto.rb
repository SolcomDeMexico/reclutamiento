class AddComentariosGerenteToRequerimeinto < ActiveRecord::Migration
  def self.up
    add_column :requerimientos, :comentarios_gerente, :text
  end

  def self.down
    remove_column :requerimientos, :comentarios_gerente
  end
end
