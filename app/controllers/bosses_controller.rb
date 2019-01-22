class BossesController < ApplicationController
  before_action :set_boss, only: [:show, :edit, :update, :destroy]

  def new
    @boss = Boss.new
  end

  def create
    # make validations
    @boss = Boss.new(boss_params)
    if @boss.valid?
      @boss.save
      redirect_to boss_path(@boss)
    else
      render :new
      # redirect_to new_boss_path
      # Toastr flash messages?
    end

  end

  def show
  end

  def edit
  end

  def update
    @boss.update(boss_params)
    if @boss.valid?
      @boss.save
      redirect_to boss_path(@boss)
    else
      @boss = Boss.find(params[:id])
      render :edit
    end
  end

  def destroy
    @boss.destroy
    redirect_to new_boss_path
  end

  private

  def set_boss
    @boss = Boss.find(params[:id])
  end

  def boss_params
    params.require(:boss).permit(:name, :username, :email, :city)
  end

end
