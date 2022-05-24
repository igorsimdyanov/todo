FactoryBot.define do
  factory :item do
    name { FFaker::CheesyLingo.title }
    done { false }
    event
    finished_at { FFaker::Time.datetime }
  end
end
