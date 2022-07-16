# frozen_string_literal: true

module Contracts
  class Unit < Contracts::Application
    def self.call(options)
      new.call(options)
    end

    params do
      required(:name).filled(:string)
      optional(:description).maybe(:string)
      required(:price).value(:float, gt?: 0)
      optional(:currency).maybe(:string)
      required(:attachments).array(:hash) do
        required(:name).filled(:string)
        required(:url).filled(:string)
      end
    end

    rule(:name) do
      key.failure('длина названия превышает 80 символов') if value.size > 80
    end
  end
end
