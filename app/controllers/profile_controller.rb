class ProfileController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @user_garden_website = url_with_protocol(@user.garden_website)
    @display_garden_website = url_no_protocol(@user.garden_website)
  end

  private
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def url_no_protocol(url)
    /^http/i.match(url) ? url.sub(/^https?\:\/\//, '') : url
  end
end
