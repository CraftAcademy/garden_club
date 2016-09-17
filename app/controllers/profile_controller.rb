class ProfileController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    if @user.latitude.nil? && @user.g_city != nil
      @user.geocode
    end
    @map_hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
end
