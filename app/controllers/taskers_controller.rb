class TaskersController < ApplicationController
  before_action :set_tasker, only: [:show, :edit, :update, :destroy]

  def new
    @tasker = Tasker.new
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

  def set_tasker
    @tasker = Tasker.find(params[:id])
  end

  def tasker_params
    params.require(:tasker).permit(:name)
  end
end
