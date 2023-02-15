class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # params[:id] is coming from the URL
    @task = Task.find(params[:id])
  end

  def new
    # this is just a page for a form
    @task = Task.new
  end

  def create
    # This actions DOES NOT have a view
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # this is just a page for a form
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    # @task.window.alert("Are you sure to delete?")
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
