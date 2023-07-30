module ApplicationHelper
  def user_details(user)
    "#{user.username}#{user.level ? " - #{user.level}" : ""}"
  end
end
