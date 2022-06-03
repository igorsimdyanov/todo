# frozen_string_literal: true

module ApiHelper
  include Rack::Test::Methods

  def json_dig(*key)
    JSON.parse(last_response.body).dig(*key)
  end

  def app
    Rails.application
  end
end
