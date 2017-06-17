class DrillsController < ApplicationController

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

  post '/drills' do
     @user = current_user
    if params[:cardio].empty?
      redirect '/drills/new'
    else
      @drill = @user.drills.build(params)
      @user.save
      redirect "drills/#{@drill.id}"
    end
  end
end
