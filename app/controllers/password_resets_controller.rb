class PasswordResetsController < ApplicationController
  
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_reset_password_email
      flash[:info] = "パスワードリセット用のメールを送りました"
      redirect_to root_path
    else
      flash.now[:danger] = "emailの登録がありませんでした"
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update(user_params)
      log_in @user
      flash[:success] = "Password has been reset"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end


  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless 
      (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_path
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "リンクの有効期限が切れています"
      redirect_to new_password_reset_url
    end
  end
end
