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
      redirect '/'
    end
  end

end
