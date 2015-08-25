class AddConfigurationStatusToUsers < ActiveRecord::Migration
  def up
    add_column :users, :configuration_status, :boolean,:default => "0"
  end
  def down
    remove_column :users, :configuration_status, :boolean,:default => "0"
  end
end
