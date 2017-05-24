class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :favorite

      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
