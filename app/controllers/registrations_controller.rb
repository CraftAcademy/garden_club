class RegistrationsController < Devise::RegistrationsController

  def after_sign_in_path_for(resource)
    user_profile_path(current_user)
  end

  def after_update_path_for(resource)
    user_profile_path(current_user)
  end

  private

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :garden_website, :blurb, :g_street, :g_street2, :g_city, :g_postcode, :g_country)
  end
end
