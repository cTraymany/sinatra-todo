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
    redirect_if_not_logged_in
    @users = User.all
    erb :"/users/index"
  end

  # GET: /users/5 shows user page
  get "/users/:id" do
    redirect_if_not_logged_in
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

  # # GET: /users/5/edit shows user edit page
  # get "/users/:id/edit" do
  #   # only show this page if check_user, otherwise show current user edit page
  #   @user =  User.find_by(params)
  #   @tasks = @user.tasks
  #   if check_user(@user)
  #     erb :"/users/edit"
  #   else
  #     redirect "/users/#{current_user.id}/edit"
  #   end
  #   # write a conditional to reflect when a user is viewing their own page or another's
  # end

  # # PATCH: /users/5 edit user page
  # patch "/users/:id" do
  #   erb :"/users/show"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/"
  # end
end
