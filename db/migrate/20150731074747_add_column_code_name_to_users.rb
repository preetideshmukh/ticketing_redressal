class AddColumnCodeNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :code_name, :string
  end
end
