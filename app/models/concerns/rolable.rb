# frozen_string_literal: true

module Rolable
  extend ActiveSupport::Concern

  class_methods do
    def act_as_rolable(role_model = Role)
      return unless defined? role_model
      return unless ActiveRecord::Base.connection.table_exists? role_model.to_s.tableize

      role_model.find_each do |role|
        define_method "#{role.code}?" do
          role_id == role.id
        end
      end
    rescue ActiveRecord::NoDatabaseError
      false
    end
  end
end
