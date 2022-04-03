ActiveAdmin.register Event do
  menu priority: 2

  index do
    id_column
    column I18n.t('active_admin.content') do |event|
      tag.strong(event.name) + tag.br + event.content.truncate(150)
    end
    column :done
    column :user
    actions
  end

  filter :id
  filter :name
  filter :content
  filter :done
  filter :finished_at

  show do
    attributes_table do
      row :id
      row :name
      row :content
      row :done
      row :finished_at
      row :user_id
      row :created_at
      row :updated_at
    end

    panel t('active_admin.items').capitalize do
      scope = resource.items.order(created_at: :desc)
      table_for scope do
        column :id
        column :name
        column :done
        column :finished_at
        column :created_at
        column :updated_at
      end
    end
  end
end
