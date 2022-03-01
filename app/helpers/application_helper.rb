# frozen_string_literal: true

module ApplicationHelper
  def current_date
    Date.current.to_s
  end

  def current_user_avatar?
    user_signed_in? && current_user.avatar.attached?
  end

  def current_user_avatar
    image_tag current_user.avatar.variant(resize_to_fill: [50, 50]), class: :rounded
  end

  def action_title(_klass, action_name)
    action_case = action_name == 'index' ? 'many' : 'accusative'

    [
      t("label.#{action_name}"),
      t("activerecord.models.user.#{action_case}")
    ].join(' ')
  end
end
