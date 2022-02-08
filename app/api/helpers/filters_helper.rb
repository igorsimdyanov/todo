# frozen_string_literal: true

module FiltersHelper
  extend Grape::API::Helpers

  params :filters do
    optional :all, type: Boolean, desc: 'вывести все, включая завершенные'
  end
end
