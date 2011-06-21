class AddCurriculumToCandidato < ActiveRecord::Migration
  def self.up
    add_column :candidatos, :curriculum_file_name, :string
  end

  def self.down
    remove_column :candidatos, :curriculum_file_name
  end
end
