#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Event < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure
  has_event_calendar

  attr_accessible :start_at, :category_id, :description, :end_at, :galery_id, :name, :place_id, :type_id, :web_links

  belongs_to :type
  belongs_to :category
  belongs_to :place
end
