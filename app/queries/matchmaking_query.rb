# frozen_string_literal: true

class MatchmakingQuery
  def self.call(user)
    User.in_queue
        .public_send(user.level)
        .where.not(id: user.id)
        .first
  end
end
