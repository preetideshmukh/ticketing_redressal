class CreateTwitterOauthSettings < ActiveRecord::Migration
  def change
    create_table :twitter_oauth_settings do |t|
    	t.string :asecret
    	t.string :atoken
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
