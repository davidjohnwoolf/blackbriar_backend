class UserSessionsController < ApplicationController
  def new
  end

  def create
    if !session[:user_id] && !session[:admin_id]
      @user = User.authenticate(params[:email], params[:password])
      if @user
        flash[:notice] = 'Successfully logged In'
        session[:user_id] = @user.id
        redirect_to root_url
      else
        flash[:alert] = 'Error logging in'
        redirect_to log_in_url
      end
    else
      flash[:alert] = 'Already Logged In'
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to root_url
  end
end
