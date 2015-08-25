class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.integer :ticket_limit
      t.integer :validity
      t.integer :base_amount
      t.float :service_tax
      t.timestamps null: false
    end
  end
end
