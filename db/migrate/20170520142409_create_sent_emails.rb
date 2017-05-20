class CreateSentEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :sent_emails do |t|
      t.references :sender, index: true, foreign_key: { to_table: :users }, null: false
      t.references :recipient, index: true, foreign_key: { to_table: :users }, null: false
      t.datetime :time_sent
      t.string :reply_to_name
      t.string :reply_to_email
      t.string :status
      t.timestamps
    end
  end
end
