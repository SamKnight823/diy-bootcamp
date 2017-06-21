class ProfilesController < ApplicationController

   get '/profiles' do
    if logged_in?
      erb :"profiles/profiles"
    else
      redirect '/login'
    end
  end

  get '/profiles/new' do
    if logged_in?
      erb :"profiles/create_profile"
    else
      redirect '/login'
    end
  end

  get '/profiles/:id' do
    @profile = Profile.find(params[:id])
    if logged_in?
      erb :"profiles/show_profile"
    else
      redirect '/login'
    end
  end

  get '/profiles/:id/edit' do
   if logged_in?
      @profile = Profile.find(params[:id])
      if session[:user_id] == @profile.user_id
        erb :"profiles/edit_profile"
      else
        redirect '/profiles'
      end
    else
      redirect '/login'
    end
  end

  patch '/profiles/:id' do
    @profile = Profile.find_by_id(params[:id])
    if params[:gender].empty?
      redirect "/profiles/#{@profile.id}/edit"
    else
      @profile.update(params.select{|p|p=="gender" || p=="age" || p=="weight" || p=="height"})
      redirect "/profiles/#{@profile.id}"
    end
  end

  post '/profiles' do
     @user = current_user
    if params[:gender].empty?
      redirect '/profiles/new'
    else
      @profile = @user.build_profile(params)
      @user.save
      redirect "profiles/#{@profile.id}"
    end
  end

  delete '/profiles/:id/delete' do
    @profile = Profile.find_by_id(params[:id])
    if session[:user_id] == @profile.user_id
      @profile.delete
      redirect '/users/profile'
    else
      redirect "/users/profile"
    end
  end
end
