class Record < ApplicationRecord
  belongs_to :user
  validates :device_name, presence: true
  validates :case_number, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :maintenance, presence: true
  validates :result, presence: true
  validates :service_engineer, presence: true
  scope :recent, -> { order("created_at DESC")}
  
  # 告诉carrierwave把图像和模型关联起来
  mount_uploader :picture, PictureUploader
  # 限制上传图片大小
  validate :picture_size
  # 验证上传的图片大小
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
