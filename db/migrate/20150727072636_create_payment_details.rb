class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|

      t.belongs_to :plan            
      t.string :transaction_id
      t.string :plan_name
      t.float :amount
      t.string :mihpayid
      t.integer :payumoneyid
      t.string :payment_status
      t.text :txn_response
      t.datetime :txn_added_on
      t.string :payee_mob_no
      t.string :payee_email
      t.string :checksum
      t.timestamps null: false
    end
  end
end
