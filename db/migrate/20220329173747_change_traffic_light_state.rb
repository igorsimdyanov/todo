class ChangeTrafficLightState < ActiveRecord::Migration[6.1]
  def change
    ActiveRecord::Base.connection.truncate(:traffic_lights)
    change_column :traffic_lights,
                  :state,
                  :integer,
                  comment: 'Состояния AASM: красный 0, желтый 10, зеленый 20',
                  using: 'state::integer'
  end
end
