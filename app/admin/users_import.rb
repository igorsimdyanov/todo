ActiveAdmin.register_page 'Импорт/экспорт пользователей' do
  page_action :download, method: :post do
    send_data Services::UsersDownload.call,
              type: 'application/octet-stream',
              filename: 'user.xlsx'
  end

  page_action :upload, method: :post do
    Services::UsersUpdateImportDelete.call(params['uploads_form']['excel'].tempfile)
    flash[:notice] = 'Пользователи были обновлены'
    redirect_to action: :index
  end

  page_action :queue_upload, method: :post do
    ex = Excel.create!(params.require(:excel).permit(:file))
    file = ActiveStorage::Blob.service.path_for(ex.file.key)
    UsersUpdateImportDeleteJob.perform_later(file))
    flash[:notice] = 'Пользователи были обновлены'
    redirect_to action: :index
  end

  content title: 'Пользователи' do
    panel 'Экспорт' do
      semantic_form_for 'download_form', url: { action: :download } do |f|
        f.button 'Скачать'
      end
    end

    panel 'Импорт' do
      form_for 'uploads_form', url: { action: :upload }, html: { multipart: true } do |f|
        f.file_field :excel, as: :file
        f.button 'Загрузить'
      end
    end    

    panel 'Фоновывй импорт' do
      form_for 'excel', url: { action: :queue_upload }, html: { multipart: true } do |f|
        f.file_field :file, as: :file
        f.button 'Загрузить'
      end
    end    
  end
end
