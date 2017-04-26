# post for blog
class Post < ActiveRecord::Base
  attr_accessible :title, :body, :published_at
  belongs_to :user
  has_many :images, as: :imageable

  scope :published, -> { where('published_at IS NOT NULL') }

  def format_date
    created_at.strftime("%b %d, %y")
  end
end
