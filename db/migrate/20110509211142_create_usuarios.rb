class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :user_id
      t.string :display_name
      t.string :email
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
