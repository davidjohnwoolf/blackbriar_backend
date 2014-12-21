class TrainingVideo < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :video, presence: true

  mount_uploader :video, VideoUploader
end
