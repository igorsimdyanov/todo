# frozen_string_literal: true

# Class User
class User
  attr_accessor :name, :surname, :patronymic, :email

  def initialize(surname, name, patronymic, email)
    @surname = surname
    @name = name
    @patronymic = patronymic
    @email = email
  end
end