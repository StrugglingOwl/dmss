class Record < ApplicationRecord
  belongs_to :user
  validates :device_name, presence: true
  validates :case_number, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :maintenance, presence: true
  validates :result, presence: true
  validates :service_engineer, presence: true

  # 告诉carrierwave把图像和模型关联起来
  mount_uploader :picture, PictureUploader

  scope :recent, -> { order("created_at DESC")}
end
