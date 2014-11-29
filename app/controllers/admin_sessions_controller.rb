class AdminSessionsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.authenticate(params[:email], params[:password])
    if @admin
      flash[:notice] = 'Successfully logged In as Admin'
      session[:admin_id] = @admin.id
      redirect_to '/'
    else
      flash[:alert] = 'Error logging in as Admin'
      redirect_to log_in_admin_path
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to '/'
  end
end
