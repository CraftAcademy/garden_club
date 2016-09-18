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
    @tags = @article.tag_list.sort_by!{ |e| e.downcase }
    @last = @tags.last
  end

  def create
    if current_user
      @article = current_user.articles.create(article_params)
      redirect_to article_path(@article)
    else
      redirect_to new_user_session_path
      flash[:alert] = error_message
    end
  end

  def edit
    if current_user
    else
      redirect_to new_user_session_path
      flash[:alert] = error_message
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
      flash[:alert] = edit_error_message
    end
  end

  def index
    @article = Article.find_by(user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :tag_list)
  end
  def error_message
    "You are not logged in - you need to be logged in to see the page you were trying to reach"
  end
  def edit_error_message
    "Article not saved"
  end
end
