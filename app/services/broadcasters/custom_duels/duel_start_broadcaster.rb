# frozen_string_literal: true

module Broadcasters
  module CustomDuels
    class DuelStartBroadcaster < BaseBroadcaster
      def self.broadcast_to(duel)
        Turbo::StreamsChannel.broadcast_update_to(
          "custom_duel_#{duel.id}",
          target: "custom-duel-#{duel.id}-starting-frame",
          content: render_template('custom_duels/duel', { duel: duel })
        )
      end
    end
  end
end
