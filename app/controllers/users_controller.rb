class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show]
  before_action :authenticate_this_user, only: [:edit, :update]
  before_action :authenticate_admin, only: [:new, :create, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created'
      redirect_to root_url
    else
      flash[:alert] = 'Error creating user'
      redirect_to new_user_url
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated'
      redirect_to user_url
    else
      flash[:alert] = 'Error updating user'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User deleted'
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_picture, :password, :password_confirmation)
  end
end
