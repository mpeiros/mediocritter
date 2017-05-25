require 'faker'

User.create(email: 'max@example.com', username: 'Max', password: 'password')

4.times do
  User.create(email: Faker::Internet.safe_email, 
              username: Faker::Name.first_name,
              password: Faker::Internet.password)
end

10.times do
  Search.create(user_id: User.all.sample.id,
                search_query: Faker::HarryPotter.character)  
end

40.times do
  Tweet.create(search_id: Search.all.sample.id,
               text: Faker::HarryPotter.quote,
               hashtag: Faker::HarryPotter.location,
               tweet_time: Faker::Date.between(1.year.ago, Date.today),
               user_actual_name: Faker::Name.name,
               user_screen_name: Faker::Internet.user_name,
               profile_pic_url: '../sloth_face.png')
end

50.times do
  Favorite.create(user_id: User.all.sample.id,
                  tweet_id: Tweet.all.sample.id)  
end

30.times do
  Comment.create(user_id: User.all.sample.id,
                 favorite_id: Favorite.all.sample.id,
                 content: Faker::ChuckNorris.fact)
end
