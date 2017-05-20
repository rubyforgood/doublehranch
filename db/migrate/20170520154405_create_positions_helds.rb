class CreatePositionsHelds < ActiveRecord::Migration[5.1]
  def change
    create_table :positions_helds do |t|
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
