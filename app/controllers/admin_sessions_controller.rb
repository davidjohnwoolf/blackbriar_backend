class AdminSessionsController < ApplicationController
  def new
  end

  def create
    if !session[:user_id] && !session[:admin_id]
      @admin = Admin.authenticate(params[:email], params[:password])
      if @admin
        flash[:notice] = 'Successfully logged In as Admin'
        session[:admin_id] = @admin.id
        redirect_to root_url
      else
        flash[:alert] = 'Error logging in as Admin'
        redirect_to log_in_admin_url
      end
    else
      flash[:alert] = 'Already Logged In'
      redirect_to root_url
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to root_url
  end
end
