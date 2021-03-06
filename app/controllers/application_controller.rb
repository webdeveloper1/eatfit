class ApplicationController < ActionController::Base
	include PublicActivity::StoreController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
 upload_path
end

def redirect_to_back_or_default(default = root_url)
  if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
    redirect_to :back
  else
    redirect_to friends_path
  end
end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:username]
  	devise_parameter_sanitizer.for(:account_update) << [:username, :avatar]
  end
end
