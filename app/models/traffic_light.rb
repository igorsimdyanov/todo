# frozen_string_literal: true

# == Schema Information
#
# Table name: traffic_lights
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  address    :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TrafficLight < ApplicationRecord
  include AASM

  enum state: {
    red: 0,
    yellow: 10,
    green: 20
  }

  aasm column: 'state', enum: true, whiny_transitions: false do
    state :red, initial: true, display: I18n.t('states.red')
    state :yellow, display: I18n.t('states.yellow'), before_enter: :logging
    state :green, display: I18n.t('states.green'), before_enter: :logging

    event :prepare, guard: LightsSwitcher do
      transitions from: :red, to: :yellow
      # guard: :active? => if: :active?
    end

    event :go, guard: LightsSwitcher do
      transitions from: :yellow, to: :green
    end

    event :stop, guard: LightsSwitcher do
      transitions from: :green, to: :red
    end
  end

  def logging
    Rails.logger.info 'Смена цвета'
  end
end
