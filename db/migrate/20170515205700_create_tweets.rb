class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :hashtags
      t.date :tweet_time
      t.string :user_actual_name
      t.string :user_screen_name

      t.timestamps
    end
  end
end
