#encoding: utf-8
class MainController < ApplicationController
  #protect_from_forgery
  SECTIONS = {
    'article' => 'Статьи',
    'event'   => 'События',
    'place'   => 'Места',
    'project' => 'Проекты',
    'person'  => 'Лица',
  }

  def index
    @categories = Category.main
    @sections = SECTIONS
  end

  def section
    @section = SECTIONS.select{|k,v| k == params[:section]}.first
    
  end  
end

