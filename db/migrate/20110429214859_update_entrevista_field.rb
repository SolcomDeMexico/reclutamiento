class UpdateEntrevistaField < ActiveRecord::Migration
  def self.up
  	change_table :entrevista do |t|
		t.rename :solicitud, :solicitud_id
	end
  end

  def self.down
  end
end
