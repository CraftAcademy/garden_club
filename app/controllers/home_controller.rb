class HomeController < ApplicationController
  def index
    @poptags = ActsAsTaggableOn::Tag.most_used(10)
    @last = @poptags.last
  end
end
