class UsersController < ApplicationController

  # GET: /signup
  get "/signup" do
    user = current_user
    redirect "/users/#{user.id}" if logged_in?
    erb :"/users/signup"
  end
  
  post "/signup" do
    # user = User.new(params)
    # user.save if user.valid?
    # authenticate user && encrypt password
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      user = User.create(params) #validate password before this line
      session[:user_id] = user.id
    # else
    #   "log in"
      # add an error message saying user needs valid log in
    end
    redirect "/users/#{user.id}"
  end

  # GET: /login
  get "/login" do
    user = User.find_by(session[:user_id])
    redirect "/users/#{user.id}" if logged_in?
    erb :"/users/login"
  end

  # POST: /index after signing up or logging in
  post "/login" do
    user = User.find_by(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/login'
    end
  end

  # GET: /users/5 shows user page
  get "/users/:id" do
    redirect_if_not_logged_in
    @user = current_user
    @tasks = @user.tasks

    # make this a checkbox

    erb :"/users/show"
  end

  # GET: /users/5/edit shows user edit page
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  # PATCH: /users/5 edit user page
  patch "/users/:id" do
    erb :"/users/show"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/"
  end
end
