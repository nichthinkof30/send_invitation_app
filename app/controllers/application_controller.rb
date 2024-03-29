class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to root_url, notice: "Login first"
    end
  end

end
