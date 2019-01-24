class TaskersController < ApplicationController
  before_action :set_tasker, only: [:show, :edit, :update, :destroy]

  def index
    # delete this
    @taskers = Tasker.all
  end

  def new
    if logged_in?
      redirect_to users_path
    else
      @tasker = Tasker.new
    end
  end

  def create
    if tasker_params[:password] != tasker_params[:password_confirmation]
      redirect_to new_tasker_path
    else
      @tasker = Tasker.new(tasker_params)
      if @tasker.valid?
        @tasker.save
        session[:user] = @tasker
        redirect_to tasker_path(@tasker)
       else
        render :new
        # redirect_to new_tasker_path
        # make validations
      end
    end
  end


  def show

  end

  def edit
  end

  def update
    if tasker_params[:password] != tasker_params[:password_confirmation]
      set_tasker
      render :edit
    else
    @tasker.update(tasker_params)
    if @tasker.valid?
      @tasker.save
      redirect_to tasker_path(@tasker)
    else
      render :edit
    # make validations
    end
  end
end

  def destroy
    @tasker.destroy
    session.delete(:user)
    redirect_to new_tasker_path
  end

  private

  def set_tasker
    @tasker = Tasker.find(params[:id])
  end

  def tasker_params
    params.require(:tasker).permit(:name, :email, :username, :city, :bio, :vehicle, :password, :password_confirmation)
  end
end
