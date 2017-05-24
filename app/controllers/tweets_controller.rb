get '/tweets' do
  @tweets = Tweet.all

  erb :index
end

post '/tweets' do
  Tweet.find_each(&:destroy)

  if TwitterAdapter.create_tweets(params[:username])
    redirect '/tweets'
  else
    @errors = ['No tweets found for that username.']
    erb :index
  end
end
