class CreateExcels < ActiveRecord::Migration[6.1]
  def change
    create_table :excels, comment: 'Вспомогательная таблица для сохранения Excel-файлов' do |t|

      t.timestamps
    end
  end
end
