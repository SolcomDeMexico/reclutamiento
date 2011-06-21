class AddCamposToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :zona_horaria, :integer, :limit => 8
    add_column :usuarios, :departamento_id, :integer
    add_column :usuarios, :habilidades, :string
    add_column :usuarios, :foto_file_name, :string
    add_column :usuarios, :foto_content_type, :string
    add_column :usuarios, :foto_file_size,:integer
  end

  def self.down
    remove_column :usuarios, :zona_horaria
    remove_column :usuarios, :departamento_id
    remove_column :usuarios, :habilidades
    remove_column :usuarios, :foto_file_name
    remove_column :usuarios, :foto_content_type
    remove_column :usuarios, :foto_file_size
  end
end
