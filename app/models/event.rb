class Event < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :items
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 300 }
end
