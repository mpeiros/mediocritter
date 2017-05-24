class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user

      t.string :search_query, null: false

      t.timestamps null: false
    end
  end
end
