class ArticlesController < ApplicationController
  protect_from_forgery
  before_filter :set_articles
  def index
  end

  def show
    @article = @articles.find(params[:id]).first
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
      uploaded_io = params[:article][:picture]
      File.open(Rails.root.join('data', 'articles' ,uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      redirect_to section_path('article')
    else
      flash[:error] =  @article.errors.to_s
      redirect_to :action => :new
    end    
  end

  private 
    def set_articles
      @articles = Article.all#Article.published
    end
end
