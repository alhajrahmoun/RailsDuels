# frozen_string_literal: true

module LeaderboardHelper
  def active_level(user)
    return 'beginner' unless user

    user.level
  end
end
