class AddTrafficLightActive < ActiveRecord::Migration[6.1]
  def change
    add_column :traffic_lights,
               :active,
               :boolean,
               default: true,
               comment: 'true - включен, false - выключен'
  end
end
