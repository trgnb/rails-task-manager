class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :details, :completed))
    @task.save
    redirect_to(tasks_path)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:title, :details, :completed))
    redirect_to(task_path)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(tasks_path)
  end
end
