class ResourcesController < ApplicationController
  before_action :authenticate_user, only: [:index]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_resource, only: [:edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:notice] = 'Resource created'
      redirect_to resources_url
    else
      flash[:alert] = 'Error creating resource'
      redirect_to new_resource_url
    end
  end

  def edit
  end

  def update
    if @resource.update_attributes(resource_params)
      flash[:notice] = 'Resource updated'
      redirect_to resources_url
    else
      flash[:alert] = 'Error updating resource'
      render :edit
    end
  end

  def destroy
    @resource.destroy
    flash[:notice] = 'Resource deleted'
    redirect_to resources_url
  end

  private

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:title, :document)
  end
end
