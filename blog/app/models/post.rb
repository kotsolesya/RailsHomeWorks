# post for blog
class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title
  belongs_to :user
  has_many :images, as: :imageable

  scope :published, -> { where('published_at IS NOT NULL') }
end
