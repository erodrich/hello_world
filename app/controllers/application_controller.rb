class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
  #Confirms a logged_in_user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Por favor, inicie su sesion"
      redirect_to login_url
    end
  end
  
  #Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
