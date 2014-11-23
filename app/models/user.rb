class User < ActiveRecord::Base
  # runs the encrypt_password method before a user is saved
  before_save :encrypt_password

  # stores a temporary password taken from the new user form
  attr_accessor :password

  # another virtual attribute for password confirmation
  validates_confirmation_of :password

  def encrypt_password
    # generate password_salt
    self.password_salt = BCrypt::Engine.generate_salt

    # generate password_hash from password + password_salt
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
