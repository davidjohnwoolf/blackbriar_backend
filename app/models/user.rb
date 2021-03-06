class User < ActiveRecord::Base
  has_many :customers
  before_save :encrypt_password

  attr_accessor :password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/ }
  validates :password, presence: true, confirmation: true
  validates_length_of :password, in: 6..20

  mount_uploader :profile_picture, ProfilePictureUploader

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
