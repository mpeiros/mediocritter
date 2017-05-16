get '/' do
  client = OAuthClient.new(consumer_key: ENV['CONSUMER_KEY'],
                           consumer_secret: ENV['CONSUMER_SECRET'],
                           token: ENV['TOKEN'],
                           token_secret: ENV['TOKEN_SECRET'])

  response = client.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=10&screen_name=mpeiros")

  JSON.parse(response.body).each do |tweet|
    tweet_hash = {}

    tweet_hash[:text] = tweet['text']

    hashtags = tweet['entities']['hashtags']
    if hashtags.length > 0 
      tweet_hash[:hashtags] = hashtags[0]['text']
    end

    tweet_hash[:tweet_time] = tweet['created_at']
    tweet_hash[:user_actual_name] = tweet['user']['name']
    tweet_hash[:user_screen_name] = tweet['user']['screen_name']

    Tweet.create(tweet_hash)
  end

  @tweets = Tweet.all

  erb :index
end
