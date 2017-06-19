class StatsController < ApplicationController

   get '/stats' do
    if logged_in?
      erb :"stats/stats"
    else
      redirect '/login'
    end
  end

  get '/stats/new' do
    if logged_in?
      erb :"stats/create_stat"
    else
      redirect '/login'
    end
  end

  get '/stats/:id' do
    @stat = Stat.find(params[:id])
    if logged_in?
      erb :"stats/show_stat"
    else
      redirect '/login'
    end
  end

  get '/stats/:id/edit' do
   if logged_in?
      @stat = Stat.find(params[:id])
      if session[:user_id] == @stat.user_id
        erb :"stats/edit_stat"
      else
        redirect '/stats'
      end
    else
      redirect '/login'
    end
  end

  patch '/stats/:id' do
    @stat = Stat.find_by_id(params[:id])
    if params[:day].empty?
      redirect "/stats/#{@stat.id}/edit"
    else
      @stat.update(params.select{|k|k=="day" || k=="age" || k=="weight" || k=="height" || k=="calories"})
      redirect "/stats/#{@stat.id}"
    end
  end

  post '/stats' do
     @user = current_user
    if params[:day].empty?
      redirect '/stats/new'
    else
      @stat = @user.stats.build(params)
      @user.save
      redirect "stats/#{@stat.id}"
    end
  end

  delete '/stats/:id/delete' do
    @stat = Stat.find_by_id(params[:id])
    if session[:user_id] == @stat.user_id
      @stat.delete
      redirect '/stats'
    else
      redirect "/stats"
    end
  end
end
