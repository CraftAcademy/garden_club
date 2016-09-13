class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #These methods overwrite Devise methods for where to send users after the method.
  # See more here: https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb
  def after_sign_in_path_for(resource)
    profile_path
  end

  def after_update_path_for(resource)
    profile_path
  end

  def configure_permitted_parameters
  #   if params[:user][:email] == params[:user][:email_confirmation]
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   else
  #     flash[:error] = "Email confirmation doesn't match"
  #     # in the future, this should return to registration page with information previously entered
  #     redirect_to root_path
  #   end
  end
end
