require './lib/user'
require 'faker'

RSpec.describe 'Пользователь' do
  context 'должен содержать' do
    let(:data) do
      {
        surnames: 10.times.collect { Faker::Name.last_name },
        names: 10.times.collect { Faker::Name.first_name },
        patronymics: 10.times.collect { Faker::Name.middle_name },
        emails: 10.times.collect { Faker::Internet.email }
      }
    end
    let(:user) do
      User.new(data[:surnames].sample, data[:names].sample, data[:patronymics].sample, data[:emails].sample)
    end
    it 'Фамилию ' do
      #expect(data[:surnames].include?(user.surname)).to be true
      expect(data[:surnames]).to include(user.surname)
    end
    it 'Имя ' do
      expect(data[:names]).to be include(user.name)
    end
    it 'Отчество ' do
      expect(data[:patronymics]).to be include(user.patronymic)
    end
    it 'Эл.почту ' do
      expect(data[:emails]).to be include(user.email)
    end
  end
end
