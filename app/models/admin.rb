class Admin < ActiveRecord::Base
  before_save :encrypt_password
  
  attr_accessor :password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates_length_of :password, in: 6..20

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    admin = Admin.where(email: email).first
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end
end
