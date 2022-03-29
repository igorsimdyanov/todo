class CreateAbout < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts, comment: 'О нас' do |t|
      t.text   :body, comment: 'Содержимое'

      t.timestamps
    end
  end
end
