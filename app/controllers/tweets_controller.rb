get '/tweets' do
  @tweets = Search.last.tweets
  erb :index
end

post '/tweets' do
  search = Search.new(search_query: params[:username])

  if logged_in?
    search.assign_attributes(user_id: current_user.id)
  end

  if search.save
    if TwitterAdapter.create_tweets(params[:username], search.id)
      redirect '/tweets'
    else
      @errors = ['No tweets found for that username.']
      erb :index
    end
  else
    @errors = search.errors.full_messages
    erb :index
  end
end
