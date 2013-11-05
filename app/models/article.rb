#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Article < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure

  attr_accessible :autor_id, :body, :category_id, :name, :sources, :autor, :type_id

  belongs_to :type
  belongs_to :category

  def get_map_info
    if self.place
      item = self.place.get_map_info
      item
    end
  end
end
