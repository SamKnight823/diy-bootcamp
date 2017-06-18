class UsersController < ApplicationController



   get '/signup' do
    if logged_in?
      redirect '/drills'
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    # binding.pry
    @user = User.new(params)
    if params[:username].empty? || params[:password].empty?
      redirect '/signup'
    end
    if @user.save
      session[:user_id] = @user.id
      redirect '/drills'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/drills'
    else
      erb :"users/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/drills'
    else
      redirect '/login'
    end
  end

  get '/users/' do
    @user=current_user
      erb :'users/show'
  end
end
