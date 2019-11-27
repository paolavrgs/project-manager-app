module ApplicationHelper

  def admin?
    return false unless user_signed_in?

    current_user.has_role? :admin
  end
end
