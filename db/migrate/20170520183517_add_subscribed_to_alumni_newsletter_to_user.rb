class AddSubscribedToAlumniNewsletterToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :subscribed_to_alumni_newsletter, :boolean, null: false, default: true
  end
end
