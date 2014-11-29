class AdminSessionsController < ApplicationController
  def new
  end

  def create
    if !session[:user_id] && !session[:admin_id]
      @admin = Admin.authenticate(params[:email], params[:password])
      if @admin
        flash[:notice] = 'Successfully logged in as admin'
        session[:admin_id] = @admin.id
        redirect_to root_url
      else
        flash[:alert] = 'Error logging in as admin'
        redirect_to log_in_admin_url
      end
    else
      flash[:alert] = 'Already logged in'
      redirect_to root_url
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to root_url
  end
end
