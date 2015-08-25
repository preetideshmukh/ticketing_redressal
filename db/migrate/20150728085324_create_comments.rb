class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer "ticket_id"
      t.text :body
      t.timestamps null: false
    end
  end
  def down
    drop_table :comments
  end
end
