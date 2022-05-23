FactoryBot.define do
  factory :comment do
    content { FFaker::CheesyLingo.title }
    user
  end
end
