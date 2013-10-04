#encoding: utf-8
class CategoriesController < ApplicationController
  #protect_from_forgery

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end

