class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users, comment: 'Пользователи системы' do |t|
      t.string :name, comment: 'Имя пользователя', index: { unique: true }
      t.string :email, comment: 'Электронный адрес пользователя', index: { unique: true }
      t.boolean :active,
                default: true,
                comment: 'пользователь активен (true) или забанен (false)'

      t.timestamps
    end
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
