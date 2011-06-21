class RemoveEstadoFromCandidato < ActiveRecord::Migration
  def self.up
    remove_column :candidatos, :estado
  end

  def self.down
    add_column :candidatos, :estado, :string
  end
end
