class SearchResultsController < ApplicationController
  before_action :authenticate_user

  def index
    if current_admin
      @results = Customer.search_by_name(params[:q])
    else
      @results = current_user.customers.search_by_name(params[:q])
    end
  end
end
