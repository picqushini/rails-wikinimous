class ArticlesController < ApplicationController
  before_action :take_article, only: [:show, :edit, :update, :destroy]
  # I Should Never Call an Ex Upon Drinking

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article.id)
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to article_path(@article.id)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def take_article
    @article = Article.find(params[:id])
  end

end
