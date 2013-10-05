class Event < ActiveRecord::Base
  attr_accessible :begin_date, :category_id, :description, :end_date, :galery_id, :name, :place_id, :type_id, :web_links

  belongs_to :type
  belongs_to :category
end
