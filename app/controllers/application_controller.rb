class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authenticate_user
    if session[:user_id] || session[:admin_id]
      return true
    else
      flash[:alert] = 'You need to be logged in to view this'
      redirect_to log_in_url
    end
  end

  def authenticate_this_user
    if session[:user_id] == User.find(params[:id]).id || session[:admin_id]
      return true
    else
      flash[:alert] = 'You cannot edit other users accounts'
      redirect_to root_url
    end
  end

  def authenticate_admin
    if session[:admin_id]
      return true
    else
      flash[:alert] = 'Page access denied'
      redirect_to root_url
    end
  end

  helper_method :current_user
  helper_method :current_admin
end
