include ActionView::Helpers::NumberHelper

namespace :active_storage_size do
  desc 'Размер ActiveStorage-хранилища'
  task count: :environment do
    byte_size = number_to_human_size(ActiveStorage::Blob.sum(:byte_size))
    puts "Размер файлов в ActiveStorage-хранилище: #{byte_size}"
  end
end
