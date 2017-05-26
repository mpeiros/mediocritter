get '/favorites/:favorite_id/comments/new' do
  @favorite = Favorite.find(params[:favorite_id])

  if request.xhr?
    erb :'partials/_comment_form', locals: { favorite: @favorite }, layout: false
  else
    erb :'comments/new'
  end
end

post '/favorites/:favorite_id/comments' do
  @favorite = Favorite.find(params[:favorite_id])
  comment = Comment.new(user_id: current_user.id, 
                        favorite_id: @favorite.id,
                        content: params[:content])

  if comment.save
    message = "#{current_user.username} left the following comment on your favorited tweet: #{comment.content}."
    TwilioAdapter.send_text(message)
  
    redirect "/users/#{@favorite.user_id}"    
  else
    @errors = comment.errors.full_messages
    erb :'comments/new'
  end
end
