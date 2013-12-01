#encoding: utf-8
require 'data'
class ApplicationController < ActionController::Base
  protect_from_forgery
  SECTIONS = {
    'article' => 'Статьи',
    'event'   => 'События',
    'place'   => 'Места',
    'project' => 'Проекты',
    'person'  => 'Лица',
  }

  private
    def set_gon_points content_class
      place_ids = Data.place_ids(@section, @content, content_class)
      points = Place.get_info_for_all place_ids
      gon.points = points
      points
    end
end
