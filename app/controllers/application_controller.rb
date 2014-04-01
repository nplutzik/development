class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def admin?
    return current_user && current_user.admin
  end

  def require_authentication
    if current_user == nil
      redirect_to login_path
    end
  end

  def require_authorization
    unless admin?
      redirect_to_root_path
    end
  end
end
