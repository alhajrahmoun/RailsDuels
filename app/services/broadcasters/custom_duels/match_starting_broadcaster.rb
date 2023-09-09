# frozen_string_literal: true

module Broadcasters
  module CustomDuels
    class MatchStartingBroadcaster < BaseBroadcaster
      def self.broadcast_to(duel)
        Turbo::StreamsChannel.broadcast_replace_to(
          "custom_duel_#{duel.id}",
          target: 'starting_countdown',
          content: render_template('custom_duels/match_starting',
                                   duel_id: duel.id,
                                   duration: duel.time_to_start)
        )

        Turbo::StreamsChannel.broadcast_remove_to(
          "custom_duel_#{duel.id}",
          target: 'duel-actions'
        )
      end
    end
  end
end
