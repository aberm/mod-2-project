class ApplicationController < ActionController::Base

  helper_method :logged_in?
  helper_method :users_path?

  def logged_in?
    !!user
  end

  def user
    session[:user] ||= nil
  end

  def users_path
    @user = Boss.find_by(username: session[:user]['username']) || Tasker.find_by(username: session[:user]['username'])
    if @user.class == Boss
      return boss_path(@user)
    elsif @user.class == Tasker
      return tasker_path(@user)
    end
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user
  end

end
