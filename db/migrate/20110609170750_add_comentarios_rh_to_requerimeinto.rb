class AddComentariosRhToRequerimeinto < ActiveRecord::Migration
  def self.up
    add_column :requerimientos, :comentarios_rh, :text
  end

  def self.down
    remove_column :requerimientos, :comentarios_rh
  end
end
