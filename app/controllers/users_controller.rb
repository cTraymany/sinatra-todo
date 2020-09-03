class UsersController < ApplicationController

  get "/signup" do
    redirect "/users/#{self.current_user.id}" if logged_in?
    erb :"/users/signup"
  end
  
  post "/signup" do
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/signup'
      # optional flash message
    end
  end
  
  get "/login" do
    redirect "/users/#{self.current_user.id}" if logged_in?
    erb :"/users/login"
  end
  
  post "/login" do
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/login'
      # optional flash message
    end
  end

  get '/users' do
    redirect_if_not_logged_in
    @users = User.all
    erb :"/users/index"
  end

  get "/users/:id" do
    redirect_if_not_logged_in
    if @user = User.find_by(id:params[:id])
      @tasks = @user.tasks
      erb :"/users/show"
    else
      redirect '/users'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
