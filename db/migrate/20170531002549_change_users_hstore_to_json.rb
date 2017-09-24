class ChangeUsersHstoreToJson < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :privacy_settings
    add_column :users, :privacy_settings, :json, default: {}
  end
end
