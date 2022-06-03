# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  active                 :boolean          default(TRUE)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  events_count           :integer          default(0)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| FFaker::Internet.user_name[0..10] + n.to_s }
    sequence(:email) { |n| "person#{n}@example#{rand(0..1000)}.com" }
    password { 'some_password' }
    active { true }
    role { create(:role) }

    factory :admin do
      role { create(:role, name: 'Администратор', code: :admin) }
      after(:create) do |user|
        def user.admin?
          true
        end
      end
    end

    factory :user_with_avatar do
      after(:create) do |user|
        file = File.open(Rails.root.join('spec/fixtures/ruby.png'))
        user.avatar.attach(
          io: file,
          filename: 'ruby.png',
          content_type: 'image/png'
        )
      end
    end
  end
end
