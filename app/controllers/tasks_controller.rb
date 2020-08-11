class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    new_task = Task.new (task_params)
    new_task.save
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])

    @task_complete = if @task.completed == true
      "This task is complete"
    else
      "This task is not complete"
    end
  end

  def destroy
    @task = Task.find(params[:id]) 
    @task.destroy
    
    redirect_to tasks_path
  end

  def new 
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])  
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    
    redirect_to task_path(@task)
  end

    private   

  def task_params
    # returns a hash of safe params
    params.require(:task).permit(:title, :details)
  end
end
