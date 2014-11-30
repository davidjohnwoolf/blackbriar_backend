class UsersController < ApplicationController
  before_filter :authenticate_user, only: [:index, :show]
  before_filter :authenticate_admin, only: [:new, :create, :destroy]
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
      flash[:notice] = 'User Created'
      redirect_to '/'
    else
      flash[:alert] = 'Error Creating User'
      redirect_to new_user_url
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
