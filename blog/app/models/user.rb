# user for blog
class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username, :password_confirmation
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :encrypt_password

  has_many :posts
  has_many :images, as: :imageable

  validates :password, length: { minimum: 8 }
  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: EMAIL_REGEX
  validates :username, presence: true
  validates :username, uniqueness: true

  scope :adult, -> { where('? - birthday >= 18', Time.now) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
