class CreateEntrevista < ActiveRecord::Migration
  def self.up
    create_table :entrevista do |t|
      t.integer :solicitud
      t.date :fecha
      t.string :comentarios

      t.timestamps
    end
  end

  def self.down
    drop_table :entrevista
  end
end
