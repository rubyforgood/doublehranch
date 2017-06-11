class AddHideColumnToPosts < ActiveRecord::Migration[5.1]
  def change
      add_column :posts, :hide, :boolean, null: false, default: false
  end
end
