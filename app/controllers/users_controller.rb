class UsersController < ApplicationController

  # GET: /signup
  get "/signup" do
    # redirect "/users/#{self.current_user.id}" if logged_in?
      # if you log out, and log back in as Gomez, check to see if this shows only Skittles
    erb :"/users/signup"
  end
  
  post "/signup" do
    # encrypt password
    user = User.new(params)
    if user.valid?
      user.save
      session[:user_id] = user.id
    # else
      # add an error message saying user needs valid log in
    end
    redirect "/users/#{user.id}"
  end
  
  # GET: /login
  get "/login" do
    # redirect "/users/#{self.current_user.id}" if logged_in?
      # if you log out, and log back in as Gomez, check to see if this shows only Skittles
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
      # put error message invalid login
    end
  end

# 
# 
# RESUME HERE
# 
# 

  # GET: /users/5 shows user page
  get "/users/:id" do
    # redirect_if_not_logged_in
    @user = User.find_by(id:params[:id])
    @tasks = @user.tasks
    erb :"/users/show"


    # if user on own page
      # add edit button
      # add delete button
    
  end

  # GET: /users/5/edit shows user edit page
  get "/users/:id/edit" do
    # should only show this page if user == current_user
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
