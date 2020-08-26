require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "doyourchores"
  end

  get '/' do
    redirect "/users/#{self.current_user.id}" if logged_in?
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
      redirect '/' if !logged_in?
    end
  end

end
