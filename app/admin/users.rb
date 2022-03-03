ActiveAdmin.register User do
  menu priority: 1, label: 'Пользователи'
  permit_params :email, :name, :active, :role_id, :password, :password_confirmation
  # actions :all, except: %i[destroy edit update]
  config.sort_order = 'updated_at_desc'

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :active
    column :role
    actions
  end

  filter :email
  filter :name
  filter :active
  filter :role

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :email
      f.input :name
      f.input :active
      f.input :role
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions do
      f.action :submit, label: 'Отправить', as: :button
    end
  end

end
