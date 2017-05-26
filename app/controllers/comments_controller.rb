get '/favorites/:favorite_id/comments/new' do
  @favorite = Favorite.find(params[:favorite_id])
  erb :'comments/new'
end

post '/favorites/:favorite_id/comments' do
  favorite = Favorite.find(params[:favorite_id])
  comment = Comment.new(user_id: current_user.id, 
                        favorite_id: favorite.id,
                        content: params[:content])

  if comment.save
    redirect '/tweets'    
  else
    @errors = comment.errors.full_messages
    erb :'comments/new'
  end
end
