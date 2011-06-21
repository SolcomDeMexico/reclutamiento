class UpdateForeignKeys < ActiveRecord::Migration
  def self.up
	change_table :solicituds do |t|
		t.rename :posicion, :posicion_id
		t.rename :candidato, :candidato_id
	end
  end

  def self.down
  end
end
