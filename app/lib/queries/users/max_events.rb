# frozen_string_literal: true

module Queries
  module Users
    module MaxEvents
      include Callable
      extend Dry::Initializer

      param :max_count, default: proc { 3 }

      def call
        User.where(id: user_ids)
      end

      private

      def user_ids
        Event.group(:user_id)
             .count
             .max_by(max_count) { |_user_id, count| count }
             .map(&:first)
      end
    end
  end
end
