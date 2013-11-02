module FileAttacheStructure
  extend ActiveSupport::Concern
  included do
    attr_accessible :picture
    has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg",
      :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
      :url => "/system/:class/:attachment/:id/:style/:filename"
    # validates :picture, :attachment_presence => true #,
    # :content_type => { :content_type => "image/jpg" },
    # :size => { :in => 0..10.kilobytes }
  end
end