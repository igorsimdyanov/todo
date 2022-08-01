# frozen_string_literal: true

module Commentable
  extend ActiveSupport::Concern

  private

  def sort_comments(comments, id = nil, level = 0, result = [])
    comment = comments.find { |c| id ? c.id == id : c.parent_id.nil? }
    return unless comment

    result << {
      comment: comment,
      level: level
    }

    comments.select { |c| c.parent_id == comment.id }
            .each { |c| sort_comments(comments, c.id, level + 1, result) }

    result
  end
end
