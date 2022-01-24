module ApplicationHelper
  def current_date
    Date.current.to_s
  end

  def action_title(klass, action_name)
    action_case = action_name == 'index' ? 'many' : 'accusative'

    [
      t("label.#{action_name}"),
      t("activerecord.models.user.#{action_case}")
    ].join(' ')
  end

  def list_tag(arr)
    tag.ul do
      safe_join(arr.map { |line| raw tag.li(line) })
    end
  end
end
