FactoryBot.define do
  factory :item do
    name { FFaker::HipsterIpsum.paragraph }
    done { false }
    event { create(:event) }
  end
end
