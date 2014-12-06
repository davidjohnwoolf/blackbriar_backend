class AdminsController < ApplicationController
  before_filter :authenticate_admin
  before_action :find_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = 'Admin created'
      redirect_to root_url
    else
      flash[:alert] = 'Error creating admin'
      redirect_to new_admin_url
    end
  end

  def edit
  end

  def update
    if @admin.update_attributes(admin_params)
      flash[:notice] = 'Admin updated'
      redirect_to admin_url
    else
      flash[:alert] = 'Error updating admin'
      render :edit
    end
  end

  def destroy
    @admin.destroy
    flash[:notice] = 'Admin deleted'
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
