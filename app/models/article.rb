#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Article < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure

  attr_accessible :author_id, :body, :category_id, :name, :sources, :author, :type_id, :posted_at

  belongs_to :type
  belongs_to :category
  belongs_to :person, :foreign_key => :author_id

  scope :published, -> { where("posted_at <= ?", Date.today)}

  def author_info
    if self.author_id
      {:id => self.author_id, :info => self.person.fio}
    else
      {:info => self.author}
    end
  end
end
