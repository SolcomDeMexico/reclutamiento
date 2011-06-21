class RenombrarJefeGerente < ActiveRecord::Migration
  def self.up
    rename_column :areas , :gerente , :usuario_id
    rename_column :departamentos , :jefe , :usuario_id
  end

  def self.down
    rename_column :areas, :usuario_id, :gerente
    rename_column :departamentos, :usuario_id, :jefe
  end
end
