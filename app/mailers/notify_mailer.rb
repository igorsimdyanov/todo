# frozen_string_literal: true

class NotifyMailer < ApplicationMailer
  def users_deadlines(user, events)
    @events = events
    # attachments['attach.png'] = File.read(Rails.root.join('public/logo.png').to_s)

    mail(
      to: user.email,
      bcc: 'admin@example.com',
      subject: I18n.t('emails.subjects.user_deadlines')
    )
  end
end
