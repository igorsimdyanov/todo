class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles, comment: 'Роли пользователя' do |t|
      t.string :name, comment: 'Заголовок'
      t.string :code, comment: 'Псевдоним'

      t.timestamps
    end

    add_column :users, :role_id, :integer, comment: 'Роль пользователя'
    add_foreign_key :users, :roles
  end
end
