#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Event < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure

  attr_accessible :begin_date, :category_id, :description, :end_date, :galery_id, :name, :place_id, :type_id, :web_links

  belongs_to :type
  belongs_to :category

  def get_map_info
    if self.place
      item = self.place.get_map_info
      item
    end
  end
end
