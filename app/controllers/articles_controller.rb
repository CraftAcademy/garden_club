class ArticlesController < ApplicationController
  def new
    if user_signed_in?
      @article = Article.new(user_id: current_user.id)
    else
      redirect_to new_user_session_path
      flash[:notice] = error_message
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    if user_signed_in?
      @user = User.find(params[:user_id])
      @article = @user.articles.create(article_params)
      redirect_to user_articles_path(@user.id, @article.id)
    else
      redirect_to new_user_session_path
      flash[:notice] = error_message
    end
  end

  def index
    if user_signed_in?
      @article = Article.all
    else
      redirect_to new_user_session_path
      flash[:notice] = error_message
    end
  end
  private
  def article_params
     params.require(:article).permit(:title, :body, :user_id)
  end

  def error_message
    "You are not logged in - you need to be logged in to see the page you were trying to reach"
  end
end
