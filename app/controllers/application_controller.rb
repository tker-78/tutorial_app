class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  # before Action
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end
end
