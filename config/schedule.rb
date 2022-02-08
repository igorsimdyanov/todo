set :chronic_options, hours24: true
set :output, error: 'log/cron_error.log', standard: 'log/cron.log'

every 1.day, at: '15:30' do
  rake 'deadline:mail'
end
