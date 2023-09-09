# frozen_string_literal: true

module Broadcasters
  module CustomDuels
    class DuelProgressBroadcaster < BaseBroadcaster
      def self.broadcast_to(duel)
        Turbo::StreamsChannel.broadcast_update_to(
          "custom_duel_#{duel.id}",
          target: "custom-duel-#{duel.id}-participants-progress",
          content: render_template('custom_duels/participants_progress', { duel: duel })
        )
      end
    end
  end
end
