# frozen_string_literal: true

desc 'Подсчет кол-ва строк в руби файлах'
task :rblines do
  num = 0
  linerb = Dir.glob('**/*.rb')
  linerb.each { |f| num += File.readlines(f).count }
  puts num
end
