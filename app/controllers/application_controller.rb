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

  # helper tasks
  # logged_in?
  # current_user

  helpers do
    def logged_in?

    end

    def current_user

    end

    def redirect_if_not_logged_in
      
    end
  end

end
