ActiveAdmin.register Item do
  menu priority: 4, label: 'Подпункты'
  permit_params :name, :done, :finished_at, :event_id

  filter :id
  filter :name
  filter :done
  filter :finished_at
end
