# frozen_string_literal: true

require_relative 'lib/user'
require 'date'
require 'faker'
require 'rspec'

user = User.new('Vlad', 'Vladovich', 'Vladov', 'lkj@lkjl.ru')
puts user.name
