class UsersController < ApplicationController

  get "/signup" do
    redirect "/users/#{self.current_user.id}" if logged_in?
    erb :"/users/signup"
  end
  
  post "/signup" do
    # encrypt password
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/signup'
      # add an error message saying user needs valid log in
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
      # put error message invalid login
    end
  end

  get '/users' do
    # redirect_if_not_logged_in
    @users = User.all
    erb :"/users/index"
  end

  # GET: /users/5 shows user page
  get "/users/:id" do
    # redirect_if_not_logged_in
    @user = User.find_by(id:params[:id])
    @tasks = @user.tasks

    erb :"/users/show"

    # how to make the boxes stay checked when page refresh

    # if user on own page
      # add edit button
      # add delete button
      # say "welcome, user!" else "user's tasks"
    
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
