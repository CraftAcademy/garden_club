class ArticlesController < ApplicationController
  def new
    if current_user
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
    if current_user
      # @user = User.find(params[:user_id])
      @article = current_user.articles.create(article_params)
      redirect_to article_path(@article)
    else
      redirect_to new_user_session_path
      flash[:notice] = error_message
    end
  end

  def index
    @article = Article.find_by(user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
  end

  private
  def article_params
    clean_tag_list(clean_tag_list(params[:tag_list]))
    params.require(:article).permit(:title, :body, :user_id, :tag_list)
  end

  def error_message
    "You are not logged in - you need to be logged in to see the page you were trying to reach"
  end

  def clean_tag_list(tag_list)

  end
end
