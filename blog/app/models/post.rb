# post for blog
class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title

  scope :published, -> { where('published_at IS NOT NULL') }
end
