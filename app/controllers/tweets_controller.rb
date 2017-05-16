get '/' do
  @tweets = Tweet.all

  erb :index
end

post '/tweets' do
  Tweet.find_each(&:destroy)

  response = Tweet.get_tweets(params[:username])

  if response.code == '200'
    JSON.parse(response.body).each do |tweet|
      tweet_data = Tweet.parse_tweet(tweet)
      Tweet.create(tweet_data)
    end
    
    redirect '/'
  else
    flash[:error] = 'No tweets found for that username.'
    redirect '/'
  end
end
