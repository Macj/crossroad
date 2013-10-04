class Place < ActiveRecord::Base
  attr_accessible :category_id, :description, :galery_id, :name, :place_id, :type_id, :web_links
end
