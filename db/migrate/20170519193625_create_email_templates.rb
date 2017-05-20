class CreateEmailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :email_templates do |t|
      t.string :label
      t.string :subject
      t.string :body
      t.integer :author_id
      t.index :author_id
    end
  end
end
