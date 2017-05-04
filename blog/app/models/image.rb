# image for blog
class Image < ActiveRecord::Base
  attr_accessible :url, :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  belongs_to :imageable, polymorphic: true
end
