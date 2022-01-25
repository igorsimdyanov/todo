module Admin::ApplicationHelper
  def activate_title(user)
    user.active? ? 'Disactive' : 'Active'
  end
end
