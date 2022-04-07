class Services::Users::Upload
  attr_reader :package

  def self.call(*args)
    new.call(*args)
  end

  def call(path)
    xlsx = Roo::Spreadsheet.open(path, extension: :xlsx)
    xlsx.default_sheet = xlsx.sheets.first

    roles = Role.all.map { |role| [role.code, role.id] }.to_h

    xlsx.each_row_streaming(pad_cells: true).each do |row|
      id, name, email, code = parse_params(row)
      User.find(id).update(name: name, email: email, role_id: roles[code])
    end
  end

  private

  def parse_params(row)
    [
      row[0].value.to_i,
      row[1].value,
      row[2].value,
      row[3].value
    ]
  end
end