class ProfileController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    if @user.latitude.nil? && @user.g_city != nil
      @user.geocode
    end
  end
end
