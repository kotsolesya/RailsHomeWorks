# image for blog
class Image < ActiveRecord::Base
  attr_accessible :url
  belongs_to :imageable, polymorphic: true
end
