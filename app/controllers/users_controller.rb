class UsersController < ApplicationController

  # GET: /signup
  get "/signup" do
    erb :"/users/signup"
  end

  # GET: /login
  get "/login" do
    erb :"/users/login"
  end

  # POST: /index after signing up or logging in
  post "/login" do
    redirect "/users/#{user.id}"
  end

  post "/signup" do
    
    redirect "/users/#{user.id}"
  end

  # GET: /users/5 shows user page
  get "/users/:id" do
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
