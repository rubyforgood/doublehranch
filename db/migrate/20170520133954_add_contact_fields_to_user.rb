class AddContactFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :phone
      t.string :facebook_username
      t.string :twitter_handle
      t.string :instagram_username
      t.string :tumblr_name
      t.string :linkedin_username
      t.string :pinterest_name
    end
  end
end
