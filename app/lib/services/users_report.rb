module Services
  class UsersReport
    attr_reader :package

    def self.call(*args)
      new.call(*args)
    end

    def initialize
      @package = Axlsx::Package.new
    end

    def call(from, to)
      sheet = worksheet

      scope(from, to).find_each do |user|
        sheet.add_row([user.name, user.events.size, user.items.size])
      end

      package.to_stream.read
    end

    private

    def scope(from, to)
      scope = User.includes(events: :items).order(:name)
      scope = scope.where(created_at: from..to) if from || to
      scope
    end

    def worksheet
      workbook = package.workbook

      workbook.add_worksheet(name: 'Первый')
    end
  end
end