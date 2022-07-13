# frozen_string_literal: true

# == Schema Information
#
# Table name: tree_comments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  child_id   :integer
#  parent_id  :integer
#
# Indexes
#
#  index_tree_comments_on_child_id                (child_id)
#  index_tree_comments_on_parent_id_and_child_id  (parent_id,child_id) UNIQUE
#
class TreeComment < ApplicationRecord
end
