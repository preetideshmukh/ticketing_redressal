class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :client_id
      t.integer :user_id
      t.string :client_name
      t.string :email
      t.string :mobile_no
      t.integer :plan_id
      t.string :plan_name
      t.float :total_amount
      t.string :hash_val
      t.string :txn_id
      t.timestamps null: false
    end
  end
end
