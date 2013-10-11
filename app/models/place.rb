#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Place < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure
  
  attr_accessible :category_id, :description, :galery_id, :name, :place_id, :type_id, :web_links

  belongs_to :type
  belongs_to :category
end
