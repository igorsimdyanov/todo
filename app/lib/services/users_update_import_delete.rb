# frozen_string_literal: true

module Services
  class UsersUpdateImportDelete
    include Callable

    attr_reader :user_ids, :user_imails, :roles

    def call(file_path)
      workbook = Roo::Spreadsheet.open file_path, extension: :xlsx
      worksheets = workbook.sheets

      user_initialize

      worksheets.each do |worksheet|
        workbook.sheet(worksheet).each_row_streaming do |row|
          process(row) unless row.empty?
        end
      end
    end

    private

    def user_initialize
      @roles = Role.all.map { |role| [role.code, role.id] }.to_h
      @user_ids = User.ids
      @user_imails = User.all.map(&:email)
    end

    def process(row)
      id, name, email, code, action = parse_row(row)

      if create?(id, email)
        create(name, email, roles[code])
      elsif action == 'delete'
        delete(id)
      else
        update(name, id, email, roles[code])
      end
    end

    def create?(id, email)
      !user_imails.include?(email) && !user_ids.include?(id)
    end

    def create(name, email, role)
      hash_user =
        {
          name: name,
          email: email,
          password: email,
          role_id: role
        }
      User.create! hash_user
    end

    def update(name, id, email, role)
      User.find_by(id: id)&.update(name: name, email: email, role_id: role)
    end

    def delete(id)
      User.find_by(id: id)&.destroy
    end

    def parse_row(row)
      array = []
      row[0].nil? ? array.push(0) : array.push(row[0].value.to_i)
      (1..4).each do |i|
        row[i].nil? ? array.push('') : array.push(row[i].value)
      end
      array
    end
  end
end
