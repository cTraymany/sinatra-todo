class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    erb :"/tasks/index"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    erb :"/tasks/new"
  end

  post "/tasks" do
    task = Task.create(task_descr:params[:description], user_id:current_user.id)
    redirect "users/#{task.user_id}"
  end

  # POST: /tasks
  post "/tasks" do
    redirect "/tasks/#{task.id}"
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    # binding.pry
    erb :"/tasks/show"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    @task = Task.find_by(id:params[:id])
    erb :"/tasks/edit"
  end
  
  # PATCH: /tasks/5
  patch "/tasks/:id" do
    task = Task.find_by(id:params[:id])
    # binding.pry
    task.task_descr = params[:description]
    task.save
    redirect "/users/#{task.user_id}"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id" do
    task = Task.find_by(id:params[:id])
    task.delete
    redirect "/users/#{task.user_id}"
  end
end
