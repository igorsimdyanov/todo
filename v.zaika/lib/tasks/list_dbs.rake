# o.sergeev
namespace :test do
  desc 'List dbs'
  task list_dbs: :environment do
    arr = %x( psql -l ).each_line.map do |s|
      elements = s.split('|')
      next if elements[1].nil?

      elements[0] if elements[1].include?('postgres')
    end
    puts 'Postgres databases:'
    arr.compact.map(&:strip).each_with_index { |v,i| puts "#{i+=1} => #{v}" }
  end
end
