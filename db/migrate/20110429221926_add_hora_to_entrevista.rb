class AddHoraToEntrevista < ActiveRecord::Migration
  def self.up
    add_column :entrevista, :hora, :time
  end

  def self.down
    remove_column :entrevista, :hora
  end
end
