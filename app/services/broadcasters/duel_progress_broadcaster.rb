# frozen_string_literal: true

module Broadcasters
  class DuelProgressBroadcaster < BaseBroadcaster
    def self.broadcast_to(duel, user)
      Turbo::StreamsChannel.broadcast_update_to(
        "duel_progress_#{duel.id}",
        target: "user_#{user.id}_progress",
        content: render_template('duels/user_progress', { user: user, duel: duel })
      )
    end
  end
end
