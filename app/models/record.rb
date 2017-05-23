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
end
