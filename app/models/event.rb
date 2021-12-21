class Event < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :items, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :name, presence: true
end
