class RootApi < Grape::API
  format :json
  prefix :api

  mount Events
end
