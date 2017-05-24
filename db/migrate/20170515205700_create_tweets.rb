class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :search

      t.string :text
      t.string :hashtag
      t.date :tweet_time
      t.string :user_actual_name
      t.string :user_screen_name
      t.string :profile_pic_url

      t.timestamps null: false
    end
  end
end
