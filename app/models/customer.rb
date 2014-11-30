class Customer < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :install_date, presence: true
  validates :mmr, presence: true
  validates :sixty_month, presence: true
  validates :eft, presence: true
  validates :activation, presence: true
end
