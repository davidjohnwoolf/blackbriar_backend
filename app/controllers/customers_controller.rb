class CustomersController < ApplicationController
  before_filter :authenticate_user, only: [:index, :show]
  before_filter :authenticate_admin, only: [:new, :create, :destroy]
  before_action :find_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if params[:users_name]
      user = User.find_by(name: params[:users_name])
      @customer.user_id = user.id unless user.nil?
    end
    if @customer.save
      flash[:notice] = 'Customer created'
      redirect_to customers_url
    else
      flash[:alert] = 'Error creating customer'
      redirect_to new_customer_url
    end
  end

  def edit
  end

  def update
    if @customer.update_attributes(customer_params)
      redirect_to customer_url
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :install_date, :mmr, :sixty_month, :eft, :activation, :user_id)
  end

end
