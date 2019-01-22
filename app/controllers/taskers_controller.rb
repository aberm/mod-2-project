class TaskersController < ApplicationController
  before_action :set_tasker, only: [:show, :edit, :update, :destroy]

  def new
    @tasker = Tasker.new
  end

  def create
    @tasker = Tasker.new(tasker_params)
    if @tasker.valid?
      @tasker.save
      redirect_to tasker_path(@tasker)
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
    @tasker.update(tasker_params)
    if @tasker.valid?
      @tasker.save
      redirect_to tasker_path(@tasker)
    else
      render :edit
    # make validations
    end
  end

  def destroy
    @tasker.destroy
    redirect_to new_tasker_path
  end

  private

  def set_tasker
    @tasker = Tasker.find(params[:id])
  end

  def tasker_params
    params.require(:tasker).permit(:name, :email, :username, :city, :bio, :vehicle)
  end
end
