class Resource < ActiveRecord::Base
  validates :title, presence: true
  validates :document, presence: true

  mount_uploader :document, DocumentUploader
end
