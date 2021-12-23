class Seo < ActiveRecord::Migration[6.1]
  def change
    create_table :seos, comment: 'Теги для поисковых ситем' do |t|
      t.string :title, comment: 'Тег title'
      t.string :description, comment: 'Тег desription'
      t.string :keywords, comment: 'Тег keywords'
      t.references :promoted, polymorphic: true, null: false

      t.timestamps
    end
  end
end
