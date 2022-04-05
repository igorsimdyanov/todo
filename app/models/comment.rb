# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  children_count   :integer          default(0), not null
#  commentable_type :string           not null
#  content          :text
#  depth            :integer          default(0), not null
#  lft              :integer          not null
#  rgt              :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint           not null
#  parent_id        :integer
#  user_id          :bigint
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_parent_id    (parent_id)
#  index_comments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  acts_as_nested_set

  after_touch :log_comment

  private

  def log_comment
    Rails.logger.info '#######################################'
    Rails.logger.info updated_at
    Rails.logger.info '#######################################'
  end
end
