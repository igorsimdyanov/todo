require 'net/imap'
require 'mail'

class EmailsController < ApplicationController
  def index
    connection = Net::IMAP.new('imap.yandex.ru', 993, true, nil)
    connection.login(ENV['EMAIL'], ENV['EMAIL_PASSWORD'])
    connection.select('INBOX')
    @email_titles = []
    connection.uid_search(%w[NOT SEEN]).each do |message_id|
      raw_message = connection.uid_fetch(message_id, 'RFC822')[0].attr['RFC822']
      email = Mail.new(raw_message)
      @email_titles << email.subject
    end
  end
end
