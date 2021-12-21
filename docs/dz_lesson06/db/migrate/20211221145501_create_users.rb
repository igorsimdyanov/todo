class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, comment: 'Пользователи системы' do |t|
      t.string :name, comment: 'Имя пользователя', index: { unique: true }
      t.string :email, comment: 'Электронный адрес пользователя', index: { unique: true }
      t.boolean :active,
                default: true,
                comment: 'пользователь активен (true) или забанен (false)'

      t.timestamps
    end

    create_table :posts, comment: 'Сообщения пользователей' do |t|
      t.string :title, comment: 'Заголовок'
      t.text :content, comment: 'Содержимое сообщения'
      t.references :user, foreign_key: true

      t.boolean :active,
                default: true,
                comment: 'Сообщение видно или не видно в системе'

      t.timestamps
    end

    create_table :marks, comment: 'Оценки пользователей' do |t|
      t.integer :value, comment: 'Числовое значение оценки'
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
