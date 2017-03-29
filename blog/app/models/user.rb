# user for blog
class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username
  validates :password, length: { minimum: 8 }
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  scope :adult, -> { where('Time.now.utc.to_date.year - birthday.to_date.year >= 18') }

  def full_name
    "#{first_name} #{last_name}"
  end
end
