get '/users/new' do
  erb :'users/new'
end

post '/users' do
  if params[:user][:password].length < 6
    @errors = ['Password must be at least 6 characters']
    erb :'users/new'
  else
    user = User.new(params[:user])

    if user.save
      session[:user_id] = user.id
      redirect '/tweets'
    else
      @errors = user.errors.full_messages
      erb :'users/new'
    end
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
