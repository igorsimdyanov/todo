FactoryBot.define do
  factory :event do
    name { FFaker::CheesyLingo.title }
    content { FFaker::CheesyLingo.sentence }
    done { false }
    user
    finished_at { FFaker::Time.datetime }

    factory :event_wrong, parent: :event do 
      name { nil }
      user { nil }
    end
  end
end
