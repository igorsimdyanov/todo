class AddCommentableToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :commentable, polymorphic: true, null: false
    remove_reference :comments, :event
  end
end
