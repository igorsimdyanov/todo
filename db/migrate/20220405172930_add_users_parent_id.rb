class AddUsersParentId < ActiveRecord::Migration[6.1]
  def change
    add_column :comments,
               :parent_id,
               :integer,
               comment: 'ссылка на родительский комментарий'
    add_index :comments, :parent_id
  end
end
