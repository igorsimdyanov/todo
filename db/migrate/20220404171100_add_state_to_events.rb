class AddStateToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events,
               :state,
               :integer,
               comment: 'Состояния AASM: created 0, running 10, pending 20, finished 30',
               using: 'state::integer'
    remove_column :events, :done
  end
end
