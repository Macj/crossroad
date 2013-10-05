#encoding: utf-8
class MainController < ApplicationController
  #protect_from_forgery
  SECTIONS = {
    'Article' => 'Статьи',
    'Event'   => 'События',
    'Place'   => 'Места',
    'Project' => 'Проекты',
    'Person'  => 'Лица',
  }

  def index
    @categories = Category.main
    @sections = SECTIONS
  end

  def section
    @section = SECTIONS.select{|k,v| k == params[:section]}.first
  end  
end

