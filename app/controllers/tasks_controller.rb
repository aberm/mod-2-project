class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:index, :index_completed, :show]

  def index
    @tasks = Task.all
  end

  def index_completed
    @tasks = Task.all
    render :'index-completed'
  end

  def new
    @task = Task.new
    @categories = [ "Assembly", "Carpentry", "Cleaning", "Decoration", "Delivery",
        "Electrical", "Errands", "Event-Planning", "Gardening", "Heavy Lifting",
        "Home Improvement", "Installation", "Moving", "Organization", "Painting",
        "Personal Assistant", "Plumbing", "Repairs", "Shopping", "Waiting-in-Line"]

  end

  def create
    @task = Task.new(task_params)
    @task.boss_id = the_user.id
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
    @categories = [ "Assembly", "Carpentry", "Cleaning", "Decoration", "Delivery",
        "Electrical", "Errands", "Event-Planning", "Gardening", "Heavy Lifting",
        "Home Improvement", "Installation", "Moving", "Organization", "Painting",
        "Personal Assistant", "Plumbing", "Repairs", "Shopping", "Waiting-in-Line"]
  end

  def update
    if the_user.class.name == "Tasker"
      @task.tasker_id = the_user.id
      redirect_to task_path(@task)
    end
    @task.update(task_params)
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
    params.require(:task).permit(:city, :description, :category, :vehicle, :minutes, :price_rate, :time)
  end
end
