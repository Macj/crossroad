class Article < ActiveRecord::Base
  attr_accessible :autor_id, :body, :category_id, :name, :sources
end
