#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Place < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure
  
  attr_accessible :category_id, :description, :galery_id, :name, :address_id, :type_id, :web_links

  belongs_to :type
  belongs_to :category
  belongs_to :address

  validates :description, :presence => true #,
  validates :name, :presence => true #,
  validates :address_id, :presence => true #,
  validates :type_id, :presence => true #,
  validates :category_id, :presence => true #,

  def get_map_info
    item = self.address.get_info
    item['title'] = self.name
    item
  end
end
