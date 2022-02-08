# frozen_string_literal: true

class RootApi < Grape::API
  format :json
  prefix :api

  mount Events
end
