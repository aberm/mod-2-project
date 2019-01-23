class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    # @task.boss = session[:boss] ??
  end

  def create
    @task = Task.new(task_params)
    @task.boss_id = task_params[:boss_id]
    @task.minutes = task_params[:minutes].to_f * 60
    @task.price_rate = task_params[:price_rate].to_f * 100

    if @task.valid?
      @task.save
      redirect_to task_path(@task)
     else
      render :new
      # make validations
    end
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    @task.boss_id = task_params[:boss_id]
    @task.minutes = task_params[:minutes].to_f * 60
    @task.price_rate = task_params[:price_rate].to_f * 100

    if @task.valid?
      @task.save
      redirect_to task_path(@task)
     else
      render :edit
      # make validations
    end
  end

  def destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:boss_id, :location, :description, :category, :vehicle, :minutes, :price_rate, :time)
  end
end
