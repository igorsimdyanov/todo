# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  content     :text
#  finished_at :datetime
#  name        :string
#  state       :integer
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
class Event < ApplicationRecord
  include AASM

  belongs_to :user, counter_cache: true
  has_many :items, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :nullify
  has_many :commentators, through: :comments, source: :user
  has_many_attached :files, strict_loading: true

  validates :name, presence: true

  enum state: {
    created: 0,
    running: 10,
    pending: 20,
    finished: 30
  }

  aasm column: 'state' do
    state :created, initial: true, display: I18n.t('state.created')
    state :running, display: I18n.t('state.running')
    state :pending, display: I18n.t('state.pending')
    state :finished, display: I18n.t('state.finished')

    event :start do
      transitions from: %i[created running pending], to: :running
    end

    event :pend do
      transitions from: %i[running pending created], to: :pending
    end

    event :complete do
      transitions from: %i[running finished], to: :finished
    end
  end
end
