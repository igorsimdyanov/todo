# frozen_string_literal: true

module Contracts
  class Application < Dry::Validation::Contract
    config.messages.default_locale = Rails.application.config.i18n.default_locale
    Rails.application.config.i18n.load_path.each do |path|
      Contracts::Application.config.messages.load_paths << path
    end
  end
end
