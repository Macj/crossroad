class Article < ActiveRecord::Base
  attr_accessible :autor_id, :body, :category_id, :name, :sources, :autor, :type_id

  belongs_to :type
  belongs_to :category

  def date
    self.created_at.strftime(" %H:%M %d.%m.%Y")
  end
end
