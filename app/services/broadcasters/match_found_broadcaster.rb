# frozen_string_literal: true

module Broadcasters
  class MatchFoundBroadcaster < BaseBroadcaster
    def self.broadcast_to(duel, current_user, opponent)
      Turbo::StreamsChannel.broadcast_replace_to(
        "queue_#{current_user.level}_#{current_user.id}",
        target: 'match',
        content: render_template('matchmaking/match_found', opponent: opponent, duel_id: duel.id)
      )

      Turbo::StreamsChannel.broadcast_remove_to(
        "queue_#{current_user.level}_#{current_user.id}",
        target: 'cancellation-section'
      )

      Turbo::StreamsChannel.broadcast_replace_to(
        "queue_#{opponent.level}_#{opponent.id}",
        target: 'match',
        content: render_template('matchmaking/match_found', opponent: current_user, duel_id: duel.id)
      )

      Turbo::StreamsChannel.broadcast_remove_to(
        "queue_#{opponent.level}_#{opponent.id}",
        target: 'cancellation-section'
      )
    end
  end
end
