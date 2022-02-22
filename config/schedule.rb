set :environment, ENV['RAILS_ENV']
set :output, error: 'log/cron_error.log', standart: 'log/cron.log'
set :chronic_options, hours24: true
env 'MAILTO', 'admin@example.com'

# every '* * * * *' do
every :weekend, at: ['15:30', '18:30'] do
  rake 'touch:hello_from_whenever', mailto: 'admin1@example.com'
  runner 'Hello.touch'
  command '~/www/test.dev/geekbrains/part6/lesson01/bin/cron.sh'
end
