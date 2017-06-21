require 'rack-flash'
class DrillsController < ApplicationController
  use Rack::Flash

   get '/drills' do
    if logged_in?
      erb :"drills/drills"
    else
      redirect '/login'
    end
  end

  get '/drills/new' do
    if logged_in?
      erb :"drills/create_drill"
    else
      redirect '/login'
    end
  end

  get '/drills/:id' do
    @drill = Drill.find(params[:id])
    if logged_in?
      erb :"drills/show_drill"
    else
      redirect '/login'
    end
  end

  get '/drills/:id/edit' do
   if logged_in?
      @drill = Drill.find(params[:id])
      if session[:user_id] == @drill.user_id
        erb :"drills/edit_drill"
      else
        redirect '/drills'
      end
    else
      redirect '/login'
    end
  end

  patch '/drills/:id' do
    @drill = Drill.find_by_id(params[:id])
    if params[:cardio].empty?
      redirect "/drills/#{@drill.id}/edit"
    else
      @drill.update(params.select{|d|d=="cardio" || d=="pushups" || d=="squats" || d=="crunches" || d=="squatjacks"})
      redirect "/drills/#{@drill.id}"
    end
  end

  post '/drills' do
     @user = current_user
    if params[:day].empty?
      flash[:message] = "Please enter Day Number"
      redirect '/drills/new'
    else
      @drill = @user.drills.build(params)
      @user.save
      redirect "drills/#{@drill.id}"
    end
  end

  delete '/drills/:id/delete' do
    @drill = Drill.find_by_id(params[:id])
    if session[:user_id] == @drill.user_id
      @drill.delete
      redirect '/drills'
    else
      redirect "/drills"
    end
  end
end
