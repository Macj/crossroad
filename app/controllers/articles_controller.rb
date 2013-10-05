class ArticlesController < ApplicationController
  protect_from_forgery

   def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    puts params.inspect
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to article_path(@article)
    else
      flash[:error] =  @article.errors.to_s
      redirect_to :action => :edit
    end
  end  

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to article_path(@article)
    else
      flash[:error] =  @article.errors.to_s
      redirect_to :action => :new
    end    
  end
end
