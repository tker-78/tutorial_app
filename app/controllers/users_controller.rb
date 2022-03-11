class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [ :edit, :update]
  before_action :admin_user?, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email 
      flash[:info] = "メールでのユーザー認証を完了してください"
      redirect_to root_path
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
    @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to root_path unless @user.activated?
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end



  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = "このページへのアクセスは許可されていません"
      redirect_to users_path 
    end
  end

  def admin_user?
    unless current_user.admin?
      flash[:danger] = "権限がありません"
      redirect_to users_path 
    end
  end

end
