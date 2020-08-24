class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    erb :"/tasks/index"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    erb :"/tasks/new"
  end

  # POST: /tasks
  post "/tasks" do
    redirect "/tasks/#{task.id}"
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    erb :"/tasks/show"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    erb :"/tasks/edit"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    erb :"/tasks/show"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    redirect "/tasks"
  end
end
