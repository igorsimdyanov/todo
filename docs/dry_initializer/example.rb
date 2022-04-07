require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

class User
  extend Dry::Initializer

  param :first_name
  param :last_name
  param :middle_name, default: proc { '-' }
  option :email
  option :login, optional: true
end

user = User.new 'Тест', 'Тестов', email: 't.test@test.ru'

p user.first_name
p user.last_name
p user.middle_name
p user.email
p user.login
