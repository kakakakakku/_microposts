class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = 'Updated successflly'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :password_confirmation)
  end
end
