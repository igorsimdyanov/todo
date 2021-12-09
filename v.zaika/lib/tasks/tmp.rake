# frozen_string_literal: true

desc 'создание txt файлов'
task tmp: :environment do
  newfiles = File.new(Rails.root.join("tmp/#{Rails.env}.txt"), 'a+')
  newfiles.write(Time.now.strftime("%d-%m-%Y %H:%M\n"))
end
