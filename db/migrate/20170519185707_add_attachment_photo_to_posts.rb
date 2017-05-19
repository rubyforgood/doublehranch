class AddAttachmentPhotoToPosts < ActiveRecord::Migration[5.0]
  def up
    change_table :posts do |t|
      t.attachment :photo
    end
  end

  def down
    remove_attachment :posts, :photo
  end
end
