class CustomersController < ApplicationController
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
    @customer.user_id = current_user.id
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
    params.require(:customer).permit(:name, :install_date, :mmr, :sixty_month, :eft, :activation)
  end

end
