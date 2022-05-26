# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  content     :text
#  done        :boolean          default(FALSE)
#  finished_at :datetime
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
