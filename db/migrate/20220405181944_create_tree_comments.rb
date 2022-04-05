class CreateTreeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :tree_comments, comment: 'Таблица замыканиий для комментариев' do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps

      t.index %i[parent_id child_id], unique: true
      t.index :child_id
    end
  end
end
