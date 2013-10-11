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
      uploaded_io = params[:article][:picture]
      File.open(Rails.root.join('data', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      redirect_to article_path(@article)
    else
      flash[:error] =  @article.errors.to_s
      redirect_to :action => :new
    end    
  end
end
