class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :text
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
