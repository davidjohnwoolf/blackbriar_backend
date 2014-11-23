class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.athenticate(params[:email], params[:password])
    if @user
      flash[:notice] = 'Successfully logged In'
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = 'Error logging in'
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to '/'
  end
end
