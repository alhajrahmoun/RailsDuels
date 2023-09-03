# frozen_string_literal: true

module Broadcasters
  module CustomDuels
    class ParticipantActionBroadcaster < BaseBroadcaster
      def self.broadcast_to(duel)
        Turbo::StreamsChannel.broadcast_update_to(
          "custom_duel_#{duel.id}",
          target: "custom-duel-#{duel.id}-participants",
          content: render_template('custom_duels/participants', { duel: duel })
        )
      end
    end
  end
end
