class Customer < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/ }
  validates :credit_grade, presence: true
  validates :tech_name, presence: true
  validates :package, presence: true
  validates :mmr, presence: true
  validates :date_sold, presence: true
  validates :date_installed, presence: true
  validates :sixty_month, presence: true
  validates :eft, presence: true
  validates :activation, presence: true
  validates :takeover, presence: true
  validates :user_id, presence: true
end
