class CreateSolicituds < ActiveRecord::Migration
  def self.up
    create_table :solicituds do |t|
      t.integer :candidato
      t.integer :posicion
      t.string :estado

      t.timestamps
    end
  end

  def self.down
    drop_table :solicituds
  end
end
