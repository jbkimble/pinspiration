class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  before_action :authorize!
  helper_method :current_user, :current_admin?, :determine_authorization

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



  def authorize!
    unless authorized?
      redirect_to root_url
      flash[:danger] = "You are not authorized to view that page."
    end
  end

  def authorized?
    PermissionsService.new(current_user, params[:controller], params[:action]).allow?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def determine_authorization(user)
    if user.admin?
      admin_dashboard_path
    else
      root_path
    end
  end

end
