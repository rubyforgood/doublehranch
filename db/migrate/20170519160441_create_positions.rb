class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :position_type
      t.timestamps
    end
  end
end
