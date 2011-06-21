class AddContentAndSizeToCandidatos < ActiveRecord::Migration
  def self.up
    add_column :candidatos, :curriculum_content_type, :string
    add_column :candidatos, :curriculum_file_size, :string
  end

  def self.down
    remove_column :candidatos, :curriculum_content_type
    remove_column :candidatos, :curriculum_file_size
  end
end
