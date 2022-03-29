ActiveAdmin.register About do
  menu priority: 3, label: 'О нас'
  permit_params :body, :map_image

  index do
    selectable_column
    id_column
    column :body
    actions
  end

  filter :body

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :body
      f.file_field :map_image, as: :file
    end
    f.actions do
      f.action :submit, label: 'Отправить', as: :button
    end
  end

end
