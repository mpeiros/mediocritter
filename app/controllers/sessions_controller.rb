get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])

  if user
    session[:user_id] = user.id
    redirect '/tweets'
  else
    @errors = ['Incorrect Login Information']
    erb :'sessions/new'
  end
end

delete '/sessions/:id' do
  session.delete(:user_id)
  redirect '/tweets'
end
