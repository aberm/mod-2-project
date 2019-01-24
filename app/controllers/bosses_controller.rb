class BossesController < ApplicationController
  before_action :set_boss, only: [:show, :edit, :update, :destroy]

  def index
    # delete this
    @bosses = Boss.all
  end

  def new
    @boss = Boss.new
  end

  def create
    # make validations
    if boss_params[:password] != boss_params[:password_confirmation]
      redirect_to new_boss_path
    else
      @boss = Boss.new(boss_params) # change to 'new'?
      if @boss.valid?
        @boss.save
        session[:user] = @boss
        redirect_to boss_path(@boss)
      else
        render :new
        # redirect_to new_boss_path
        # Toastr flash messages?
      end
    end

  end

  def show
  end

  def edit
  end

  def update
    if boss_params[:password] != boss_params[:password_confirmation]
      set_boss
      render :edit
    else
      @boss.update(boss_params)
      if @boss.valid?
        @boss.save
        redirect_to boss_path(@boss)
      else
        render :edit
      end
    end
  end

  def destroy
    @boss.destroy
    session.delete(:user)
    redirect_to new_boss_path
  end

  private

  def set_boss
    @boss = Boss.find(params[:id])
  end

  def boss_params
    params.require(:boss).permit(:name, :username, :email, :city, :password, :password_confirmation)
  end

end
