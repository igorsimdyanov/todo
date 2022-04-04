class AddStateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users,
               :state,
               :integer,
               comment: 'Состояния AASM: created 0, active 10, banned 20, archived 30',
               using: 'state::integer'
    remove_column :users, :active
  end
end
