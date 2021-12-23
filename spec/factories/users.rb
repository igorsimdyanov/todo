FactoryBot.define do
  factory :user do
    sequence(:name) { |n| FFaker::Internet.user_name[0..10] + n.to_s }
    sequence(:email) { |n| "person#{n}@example.com" }
    active { true }
    role { create(:role) }
  end
end
