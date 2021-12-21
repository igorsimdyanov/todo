class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_touch :log_comment

  private

  def log_comment
    Rails.logger.info '#######################################'
    Rails.logger.info updated_at
    Rails.logger.info '#######################################'
  end
end
