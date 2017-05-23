class Record < ApplicationRecord
  belongs_to :user
  validates :device_name, presence: true

  scope :recent, -> { order("created_at DESC")}
end
