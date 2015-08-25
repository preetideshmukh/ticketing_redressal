class AddColumnCustomerCareCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :customer_care_code, :string
  end
end
