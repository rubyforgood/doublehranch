class SetDefaultPrivacySettings < ActiveRecord::Migration[5.1]
  def change
      change_column :users, :privacy_settings, :hstore, default: {facebook_username:  false, 
                                                                  twitter_handle:     false,
                                                                  instagram_username: false,
                                                                  tumblr_name:        false, 
                                                                  linkedin_username:  false,
                                                                  pinterest_name:     false}, 
                                                                  null: false
  end
end
