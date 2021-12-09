# frozen_string_literal: true

desc 'Подсчет кол-ва руби файлов'
task :rbcount do
  puts Dir.glob('**/*.rb').count
end
