class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 16, minimum: 2 }
end
