post '/tweets/:tweet_id/favorites' do
  tweet = Tweet.find(params[:tweet_id])
  favorite = Favorite.new(user_id: current_user.id, tweet_id: tweet.id)

  if favorite.save
    redirect '/tweets'
  else
    @errors = favorite.errors.full_messages
    erb :index
  end
end
