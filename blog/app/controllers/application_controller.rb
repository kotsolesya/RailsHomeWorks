# to do
class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
    redirect_to log_in_path unless current_user
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
