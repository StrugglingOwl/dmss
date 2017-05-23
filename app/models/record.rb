class Record < ApplicationRecord
  belongs_to :user
  validates :device_name, presence: true
end
