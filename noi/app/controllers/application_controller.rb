class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter  :require_login

  protected
  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
  end

  def require_login
    unless current_user
      redirect_to new_user_path, flash: {success: "Please log in"}
    end
  end

end
