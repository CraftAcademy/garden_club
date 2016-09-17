class TagsController < ApplicationController
  def show
    @articles = Article.tagged_with(params[:id], match_all: true)
    @tag = params[:id]
  end
end
