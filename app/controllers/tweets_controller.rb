get '/' do
  response = Tweet.get_tweets('mpeiros')

  JSON.parse(response.body).each do |tweet|
    tweet_data = Tweet.parse_tweet(tweet)
    Tweet.create(tweet_data)
  end

  @tweets = Tweet.all

  erb :index
end

post '/' do
  
end