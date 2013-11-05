#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Project < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure
  
  attr_accessible :category_id, :description, :galery_id, :name, :org_group_id, :type_id, :web_links

  belongs_to :type
  belongs_to :category

  def get_map_info
    if self.place
      item = self.place.get_map_info
    end
    item
  end
end
