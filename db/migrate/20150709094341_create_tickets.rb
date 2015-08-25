class CreateTickets < ActiveRecord::Migration
  def up
    create_table :tickets do |t|
      t.integer "user_id"
      t.string :crn
      t.string :msp_name
      t.string :client
      t.string :participant_name
      t.string :participant_mobile_no
      t.string :participant_email
      t.string :category,               :null => false, :default => ""
      t.text :description    
      t.string :forwarded_to          
      t.string :age_of_complaint
      t.string :remark
      #attachment
      t.string :resolution_period
      t.string :status,                :null => false, :default => "New"
      t.string :priority,              :null => false, :default => ""  
      
      t.timestamps null: false
    end
  end
  def down
    drop_table :tickets
  end
end