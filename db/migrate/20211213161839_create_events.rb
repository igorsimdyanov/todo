class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events, comment: 'Список дел' do |t|
      t.string :name, comment: 'Заголовок'
      t.text :content, comment: 'Детальное описание'
      t.boolean :done, default: false,
                comment: 'Статус: завершено (true), или нет (false)'
      t.datetime :finished_at, comment: 'Дата и время завершения дела'
      t.references :user, foreign_key: true,
                   comment: 'Внешний ключ для связи с таблицей users'

      t.timestamps
    end
  end
end
