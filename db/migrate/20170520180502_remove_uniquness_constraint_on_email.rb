class RemoveUniqunessConstraintOnEmail < ActiveRecord::Migration[5.1]
  def up
    remove_index :users, :email
    change_column :users, :email, :string, unique: false, index: true
  end

  def down
    add_index :users, :email, unique: true
    change_column :users, :email, :string, index: true
  end
end
