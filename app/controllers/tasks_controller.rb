class TasksController < ApplicationController

  get "/tasks/new" do
    redirect_if_not_logged_in
    erb :"/tasks/new"
  end

  post "/tasks" do
    redirect_if_not_logged_in
    task = Task.create(task_descr:params[:description], user_id:current_user.id)
    redirect "users/#{task.user_id}"
  end

  get "/tasks/:id/edit" do
    redirect_if_not_logged_in
    @task = Task.find_by(id:params[:id])
    erb :"/tasks/edit"
  end
  
  patch "/tasks/:id" do
    redirect_if_not_logged_in
    task = Task.find_by(id:params[:id])
    task.task_descr = params[:description]
    task.save
    redirect "/users/#{task.user_id}"
  end

  delete "/tasks/:id" do
    redirect_if_not_logged_in
    task = Task.find_by(id:params[:id])
    task.delete
    redirect "/users/#{task.user_id}"
  end
end
