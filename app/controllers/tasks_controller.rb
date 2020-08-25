class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    redirect_if_not_logged_in
    # there is no task/index erb
    erb :"/tasks/index"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    redirect_if_not_logged_in
    erb :"/tasks/new"
  end

  post "/tasks" do
    redirect_if_not_logged_in
    task = Task.create(task_descr:params[:description], user_id:current_user.id)
    redirect "users/#{task.user_id}"
  end

  # POST: /tasks
  post "/tasks" do
    redirect_if_not_logged_in
    redirect "/tasks/#{task.id}"
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    redirect_if_not_logged_in
    # task show page -- maybe delete this one
    # binding.pry
    erb :"/tasks/show"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    redirect_if_not_logged_in
    @task = Task.find_by(id:params[:id])
    erb :"/tasks/edit"
  end
  
  # PATCH: /tasks/5
  patch "/tasks/:id" do
    redirect_if_not_logged_in
    task = Task.find_by(id:params[:id])
    # binding.pry
    task.task_descr = params[:description]
    task.save
    redirect "/users/#{task.user_id}"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id" do
    redirect_if_not_logged_in
    task = Task.find_by(id:params[:id])
    task.delete
    redirect "/users/#{task.user_id}"
  end
end
