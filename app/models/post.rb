class Post < ApplicationRecord
  belongs_to :user
  belongs_to :record

  validates :content, presence: true

  scope :recent, -> { order("created_at DESC")}

end
