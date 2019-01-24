class PagesController < ApplicationController

  def home
    if logged_in?
      redirect_to tasks_path
    else
      render :home
    end
  end

  def about
  end

  def contact
  end

  def faq
  end

  def signup
    render :signup
  end

end
