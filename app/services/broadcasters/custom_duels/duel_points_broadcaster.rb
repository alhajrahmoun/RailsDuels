# frozen_string_literal: true

module Broadcasters
  module CustomDuels
    class DuelPointsBroadcaster < BaseBroadcaster
      def self.broadcast_to(duel, user)
        Turbo::StreamsChannel.broadcast_update_to(
          "custom_duel_#{duel.id}",
          target: "custom-duel-#{duel.id}-user-#{user.id}-points",
          content: render_template('custom_duels/duel_points', { duel: duel, user: user })
        )
      end
    end
  end
end
