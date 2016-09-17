class TagsController < ApplicationController
  def show
    @articles = Article.tagged_with(params[:id])
    @tag = params[:id]
  end
end
