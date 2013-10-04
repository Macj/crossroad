class ArticlesController < ApplicationController
  protect_from_forgery

   def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
