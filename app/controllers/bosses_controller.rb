class BossesController < ApplicationController
  before_action :set_boss, only: [:show, :edit, :update, :destroy]

  def new
    @boss = Boss.new
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

  def set_boss
    @boss = Boss.find(params[:id])
  end

  def boss_params
    params.require(:boss).permit(:name)
  end

end
