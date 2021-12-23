class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_touch :log_comment
  has_one :seo, as: :promoted

  private

  def log_comment
    Rails.logger.info '#######################################'
    Rails.logger.info updated_at
    Rails.logger.info '#######################################'
  end
end
