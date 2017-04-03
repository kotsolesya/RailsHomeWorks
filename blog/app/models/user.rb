# user for blog
class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username
  # attr_accessible :first_name,  :last_name,  :username,  :password,  :email,  :birthday,  :created_at,  :updated_at
  has_many :posts
  has_many :images, as: :imageable

  validates :password, length: { minimum: 8 }
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  scope :adult, -> { where('? - birthday >= 18', Time.now) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
