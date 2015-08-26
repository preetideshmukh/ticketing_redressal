class CreatePostemails < ActiveRecord::Migration
  def change
    create_table :postemails do |t|
      t.text :body
      t.string :email

      t.timestamps null: false
    end
  end
end
