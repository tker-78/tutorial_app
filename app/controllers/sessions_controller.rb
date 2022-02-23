class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
<<<<<<< HEAD
=======
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
>>>>>>> advanced-login
      redirect_to users_path 
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
<<<<<<< HEAD
    logout
=======
    logout if logged_in?
    flash[:danger] = "ログアウトしました"
>>>>>>> advanced-login
    redirect_to root_path
  end

end
