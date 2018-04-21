class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # def after_sign_up_path_for(resource)
  #  '/an/example/path' # Or :prefix_to_your_route
  # end
  # def after_sign_in_path_for(resource) 
  # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:username, :email, :password, :password_confirmation, :current_password, :role)
      end
      
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:username, :email, :password, :password_confirmation, :current_password, :role, :profession, :service, :status)
    end
  end

  def custom_auth
    unless current_user.expert?
      respond_to do |format|
        format.html { redirect_to "/", notice: "Your are not authorize to access." }
      end
    end
  end
end
