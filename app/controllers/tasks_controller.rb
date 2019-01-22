class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    # make validations
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
