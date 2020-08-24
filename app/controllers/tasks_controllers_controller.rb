class TasksController < ApplicationController

  # GET: /tasks_controllers
  get "/tasks_controllers" do
    erb :"/tasks_controllers/index.html"
  end

  # GET: /tasks_controllers/new
  get "/tasks_controllers/new" do
    erb :"/tasks_controllers/new.html"
  end

  # POST: /tasks_controllers
  post "/tasks_controllers" do
    redirect "/tasks_controllers"
  end

  # GET: /tasks_controllers/5
  get "/tasks_controllers/:id" do
    erb :"/tasks_controllers/show.html"
  end

  # GET: /tasks_controllers/5/edit
  get "/tasks_controllers/:id/edit" do
    erb :"/tasks_controllers/edit.html"
  end

  # PATCH: /tasks_controllers/5
  patch "/tasks_controllers/:id" do
    redirect "/tasks_controllers/:id"
  end

  # DELETE: /tasks_controllers/5/delete
  delete "/tasks_controllers/:id/delete" do
    redirect "/tasks_controllers"
  end
end
