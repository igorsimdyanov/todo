class Item < ApplicationRecord
  belongs_to :event

  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 300 }
end
