class BossesController < ApplicationController
  before_action :set_boss, only: [:show, :edit, :update, :destroy]

  def new
    @boss = Boss.new
  end

  def create
    @boss = Boss.create(boss_params)
    redirect_to boss_path(@boss)
    # make validations
  end

  def show
  end

  def edit
  end

  def update
    @boss = Boss.create(boss_params)
    redirect_to boss_path(@boss)
  end

  def destroy
  end

  private

  def set_boss
    @boss = Boss.find(params[:id])
  end

  def boss_params
    params.require(:boss).permit(:name, :username, :email, :city)
  end

end
