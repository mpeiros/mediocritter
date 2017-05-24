class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :favorites

      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
