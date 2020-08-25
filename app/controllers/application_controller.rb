require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public' # do we need this?
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "doyourchores"
  end

  get '/' do
    erb :home
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      redirect '/' if !logged_in
    end

    def check_user(user)
      user == current_user
    end

    def check_task(task)
      task.user == current_user
    end
  end

end
