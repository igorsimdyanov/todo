# frozen_string_literal: true

module Services
  module Users
    class Download
      attr_reader :package

      def self.call(*args)
        new.call(*args)
      end

      def initialize
        @package = Axlsx::Package.new
      end

      def call
        sheet = worksheet

        scope.find_each do |user|
          sheet.add_row([user.id, user.name, user.email, user.role.code])
        end

        package.to_stream.read
      end

      private

      def scope
        User.includes(:role).order(:id)
      end

      def worksheet
        workbook = package.workbook

        workbook.add_worksheet(name: 'Первый')
      end
    end
  end
end
