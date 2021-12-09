# frozen_string_literal: true

desc 'Проверка возраста по дате рождения (ДД.ММ.ГГГГ)'
task :age, [:birthdate] => :environment do |_task, args|
  args.with_defaults(birthdate: '23.04.1986')
  puts Age.birthday(args[:birthdate])
end
