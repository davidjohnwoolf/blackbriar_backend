class Customer < ActiveRecord::Base
  include PgSearch

  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, format: { with: /\A\d{5}\z/ }
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/ }
  validates :credit_score, presence: true, format: { with: /\A\d{3}\z/ }
  validates :tech_name, presence: true
  validates :package, presence: true
  validates :mmr, presence: true
  validates :date_sold, presence: true
  validates :date_installed, presence: true
  validates :user_id, presence: true

  mount_uploader :contract_ama, ContractAmaUploader
  mount_uploader :contract_sop, ContractSopUploader

  pg_search_scope :search_by_name, against: :name

  after_create do
    eft_stat = user.customers.where(eft: true).count * 100 / user.customers.count
    user.update_attribute(:eft_stat, eft_stat)
    sixty_month_stat = user.customers.where(sixty_month: true).count * 100 / user.customers.count
    user.update_attribute(:sixty_month_stat, sixty_month_stat)
    activation_stat = user.customers.where(activation: true).count * 100 / user.customers.count
    user.update_attribute(:activation_stat, activation_stat)
    takeover_stat = user.customers.where(takeover: true).count * 100 / user.customers.count
    user.update_attribute(:takeover_stat, takeover_stat)
    attrition = user.customers.where(canceled: true).count * 100 / user.customers.count
    user.update_attribute(:attrition, attrition)
    mmr_stat = user.customers.average(:mmr).round(2)
    user.update_attribute(:mmr_stat, mmr_stat)
    credit_score_stat = user.customers.average(:credit_score).round
    user.update_attribute(:credit_score_stat, credit_score_stat)
    basic_stat = user.customers.where(package: 'Basic').count * 100 / user.customers.count
    user.update_attribute(:basic_stat, basic_stat)
    basic_image_stat = user.customers.where(package: 'Basic Image').count * 100 / user.customers.count
    user.update_attribute(:basic_image_stat, basic_image_stat)
    go_green_stat = user.customers.where(package: 'Go Green').count * 100 / user.customers.count
    user.update_attribute(:go_green_stat, go_green_stat)
    basic_automation_stat = user.customers.where(package: 'Basic Automation').count * 100 / user.customers.count
    user.update_attribute(:basic_automation_stat, basic_automation_stat)
    automation_plus_stat = user.customers.where(package: 'Automation Plus').count * 100 / user.customers.count
    user.update_attribute(:automation_plus_stat, automation_plus_stat)
    fort_knox_stat = user.customers.where(package: 'Fort Knox').count * 100 / user.customers.count
    user.update_attribute(:fort_knox_stat, fort_knox_stat)
    sales_year = user.customers.where('extract(year from date_installed) = ?', Time.now.year).count
    user.update_attribute(:sales_year, sales_year)
    sales_month = user.customers.where('extract(month from date_installed) = ?', Time.now.month).count
    user.update_attribute(:sales_month, sales_month)
  end
end
