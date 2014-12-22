class Resource < ActiveRecord::Base
  validates :title, presence: true
  validates :document, presence: true
end
