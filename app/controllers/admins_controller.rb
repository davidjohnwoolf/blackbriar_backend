class AdminsController < ApplicationController
  before_filter :authenticate_admin
  before_action :find_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def show
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = 'Admin Created'
      redirect_to '/'
    else
      flash[:alert] = 'Error Creating Admin'
      redirect_to new_admin_url
    end
  end

  def edit
  end

  def update
    if @admin.update_attributes(admin_params)
      redirect_to admin_url
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_url
  end

  private

  def find_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
