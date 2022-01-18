FactoryBot.define do
  factory :event do
    name { FFaker::Lorem.phrase }
    content { FFaker::Lorem.paragraph }
    user { create(:user) }
    done { false }
  end
end
