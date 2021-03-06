class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in(user)
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "アカウントが有効化されていません"
        message += "メールを確認してアカウントを有効化してください"
        flash[:warning] = message
        redirect_to root_path
      end
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    flash[:danger] = "ログアウトしました"
    redirect_to root_path
  end

end
