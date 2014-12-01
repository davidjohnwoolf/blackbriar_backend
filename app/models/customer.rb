class Customer < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :install_date, presence: true
  validates :mmr, presence: true
end
