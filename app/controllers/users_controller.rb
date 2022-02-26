class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [ :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録が成功しました"
      redirect_to @user
    else
      flash[:danger] = "ユーザー登録に失敗しました"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザー情報を更新できませんでした"
      render 'edit'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # before Action
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = "このページへのアクセスは許可されていません"
      redirect_to users_path 
    end
  end

end
