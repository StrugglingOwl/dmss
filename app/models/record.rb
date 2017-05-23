class Record < ApplicationRecord
  validates :device_name, presence: true
end
