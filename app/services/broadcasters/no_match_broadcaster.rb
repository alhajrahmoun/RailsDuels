# frozen_string_literal: true

module Broadcasters
  class NoMatchBroadcaster < BaseBroadcaster
    def self.broadcast_to(current_user)
      Turbo::StreamsChannel.broadcast_replace_to(
        "queue_#{current_user.level}_#{current_user.id}",
        target: 'match',
        content: render_template('matchmaking/no_match_found')
      )
    end
  end
end
