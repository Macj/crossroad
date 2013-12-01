class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id

  scope :main, -> { includes(:children).where(:parent_id => nil) }

  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Category"

end
