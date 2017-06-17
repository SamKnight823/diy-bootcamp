class DrillsController < ApplicationController

   get '/drills' do
    if logged_in?
      erb :"drills/drills"
    else
      redirect '/login'
    end
  end
end
