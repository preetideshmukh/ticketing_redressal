class CreateUserPlanDetails < ActiveRecord::Migration
  def change
    create_table :user_plan_details do |t|
	  
      t.belongs_to :plan
      t.belongs_to :payment_detail
      t.belongs_to :user
      t.integer :ticket_count      
      t.integer :validity
      t.date :valid_from
      t.date :valid_to
      t.timestamps null: false
    end
  end
end
