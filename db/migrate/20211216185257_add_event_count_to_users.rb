class AddEventCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :events_count, :integer, default: 0
  end
end
