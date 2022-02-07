FactoryBot.define do
  factory :event do
    name { FFaker::CheesyLingo.title }
    content { FFaker::BaconIpsum.paragraph }
    done { false }
    user
    finished_at { FFaker::Time.datetime }
  end
end
