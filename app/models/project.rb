class Project < ActiveRecord::Base
  attr_accessible :category_id, :description, :galery_id, :name, :org_group_id, :type_id, :web_links
end
