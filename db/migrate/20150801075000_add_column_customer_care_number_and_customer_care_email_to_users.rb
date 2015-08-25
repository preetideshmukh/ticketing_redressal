class AddColumnCustomerCareNumberAndCustomerCareEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :customer_care_number, :string
    add_column :users, :customer_care_email, :string
  end
end
