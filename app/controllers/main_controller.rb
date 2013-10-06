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
  before_filter :sections_init

  def index
    @categories = Category.main
  end

  def section
    @section = SECTIONS.select{|k,v| k == params[:section]}.first
    @categories = Category.main
    @content = eval(@section[0].humanize).all
  end  

  private
    def sections_init
      @sections = SECTIONS
    end
end

