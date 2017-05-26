post '/tweets/:tweet_id/favorites' do
  tweet = Tweet.find(params[:tweet_id])
  favorite = Favorite.new(user_id: current_user.id, tweet_id: tweet.id)

  if favorite.save
    if request.xhr?
      status 200
      erb :'partials/_favorite_icon', layout: false
    else
      redirect '/tweets'
    end
  else
    if request.xhr?
      status 422
    else
      @errors = favorite.errors.full_messages
      erb :index
    end
  end
end

delete '/favorites/:id' do
  Favorite.find(params[:id]).destroy
  redirect "/users/#{current_user.id}"
end
