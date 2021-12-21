class Item < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
end
