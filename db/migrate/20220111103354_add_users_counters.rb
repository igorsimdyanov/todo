class AddUsersCounters < ActiveRecord::Migration[6.1]
  def change
    add_column :users,
               :events_done_count,
               :integer,
               default: 0,
               comment: 'Счетчик выполненных дел'
    add_column :users,
               :events_not_done_count,
               :integer,
               default: 0,
               comment: 'Счетчик невыполненных дел'
  end
end
