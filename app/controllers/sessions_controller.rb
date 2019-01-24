class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:new, :create]

  def new #login_path
    if logged_in?
      @user = Boss.find_by(username: session[:user]['username']) || Tasker.find_by(username: session[:user]['username'])
    end
    render :new
  end

  def create
    if params[:username].blank? || params[:username].nil?
      redirect_to sessions_new_path
    else
      @user = Boss.find_by(username: params[:username]) || Tasker.find_by(username: params[:username])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user] = @user
      redirect_to users_path #written url to show path?
    end
  end

  def destroy #logout_path
    session.delete(:user)
    redirect_to login_path #or index?
  end

end
