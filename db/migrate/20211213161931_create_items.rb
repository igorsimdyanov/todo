class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, comment: 'Подпункты дела' do |t|
      t.string :name, comment: 'Заголовок'
      t.boolean :done, default: false,
                comment: 'Статус: завершено (true), или нет (false)'
      t.datetime :finished_at, comment: 'Дата и время завершения подпункта'
      t.references :event, foreign_key: true,
                   comment: 'Внешний ключ для связи с таблицей events'

      t.timestamps
    end
  end
end
