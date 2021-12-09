# frozen_string_literal: true

class Age
  def self.birthday(date)
    date_rozd = date.split('.').map(&:to_i)
    date, month, year = *date_rozd
    curent_date = Date.today.day
    curent_month = Date.today.month
    curent_year = Date.today.year

    q = curent_year - year - (curent_month > month || (curent_month == month && curent_date >= date) ? 0 : 1)

    curent_year >= year ? "Ваш возраст: #{q}" : 'Вы из будущего'
  end
end
