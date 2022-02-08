# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('noreplay@example.com', 'TODO-сайт')
  layout 'mailer'
end
