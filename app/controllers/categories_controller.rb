#encoding: utf-8
class CategoriesController < ApplicationController
  #protect_from_forgery

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @article_content = Article.where(:category_id => params[:id])
    @place_content = Place.where(:category_id => params[:id])
    @project_content = Project.where(:category_id => params[:id])
    @event_content = Event.where(:category_id => params[:id])

    @section_type = params[:section_type]
    request = Type.where(:category_id => @category.id)
    if @section_type
      request = request.where(:section_type => @section_type)
    end
    @types = request
    #Think about it
    #@people_content = Person.where(:category_id => params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    puts params.inspect
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to :action => :show
    else
      flash[:error] = @category.errors.to_s
      redirect_to :action => :edit
    end
  end  
end

