class RemoveHoraFromEntrevista < ActiveRecord::Migration
  def self.up
    remove_column :entrevista, :hora
	remove_column :entrevista, :fecha
	add_column :entrevista, :fecha, :datetime
  end

  def self.down
    add_column :entrevista, :hora, :time
  end
end
