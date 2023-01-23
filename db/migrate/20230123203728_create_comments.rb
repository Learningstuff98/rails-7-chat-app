class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :chatroom_id
      t.string :content, null: false
      t.timestamps
    end
    add_index :comments, :chatroom_id
  end
end
