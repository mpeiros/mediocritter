module TwitterAdapter
  TWITTER_CLIENT = OAuthClient.new(consumer_key: ENV['CONSUMER_KEY'],
                                   consumer_secret: ENV['CONSUMER_SECRET'],
                                   token: ENV['TOKEN'],
                                   token_secret: ENV['TOKEN_SECRET'])

  def self.get_tweets(username)
    TWITTER_CLIENT.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=10&screen_name=#{username}")
  end

  def self.parse_tweet(tweet)
    tweet_hash = {}
    tweet_hash[:text] = tweet['text']

    hashtags = tweet['entities']['hashtags']
    if hashtags.length > 0 
      tweet_hash[:hashtag] = hashtags[0]['text']
    end

    tweet_hash[:tweet_time] = tweet['created_at']
    tweet_hash[:user_actual_name] = tweet['user']['name']
    tweet_hash[:user_screen_name] = tweet['user']['screen_name']
    tweet_hash[:profile_pic_url] = tweet['user']['profile_image_url']

    tweet_hash
  end

  def self.create_tweets(username)
    response = self.get_tweets(username)

    if response.code == '200'
      JSON.parse(response.body).each do |tweet|
        tweet_data = self.parse_tweet(tweet)
        Tweet.create(tweet_data)
      end
      true
    else
      false
    end
  end
end
