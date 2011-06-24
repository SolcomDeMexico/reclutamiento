class AddPerfilToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :perfil, :string
  end

  def self.down
    remove_column :usuarios, :perfil
  end
end
