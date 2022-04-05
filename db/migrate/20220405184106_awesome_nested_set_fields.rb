class AwesomeNestedSetFields < ActiveRecord::Migration[6.1]
  def change
    ActiveRecord::Base.connection.truncate(:comments)
    add_column :comments, :lft, :integer, null: false, index: true
    add_column :comments, :rgt, :integer, null: false, index: true
    add_column :comments, :depth, :integer, null: false, default: 0
    add_column :comments, :children_count, :integer, null: false, default: 0
  end
end
