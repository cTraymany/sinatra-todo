class TasksController < ApplicationController

  # GET: /tasks_controllers
  get "/" do
    erb :"/tasks/index"
  end

  # GET: /tasks_controllers/new
  get "/tasks/new" do
    erb :"/tasks/new"
  end

  # POST: /tasks_controllers
  post "/tasks" do
    redirect "/tasks"
  end

  # GET: /tasks_controllers/5
  get "/tasks/:id" do
    erb :"/tasks/show"
  end

  # GET: /tasks_controllers/5/edit
  get "/tasks/:id/edit" do
    erb :"/tasks/edit"
  end

  # PATCH: /tasks_controllers/5
  patch "/tasks/:id" do
    redirect "/tasks/:id"
  end

  # DELETE: /tasks_controllers/5/delete
  delete "/tasks/:id/delete" do
    redirect "/tasks"
  end
end
