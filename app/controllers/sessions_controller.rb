class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      current_user
      redirect_to users_path 
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    current_user.nil
  end

end
