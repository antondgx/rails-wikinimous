class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Article.all
  end

  def create
    Article.create(strong_params)
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
  end

  def update
    @article.update(strong_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def strong_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
