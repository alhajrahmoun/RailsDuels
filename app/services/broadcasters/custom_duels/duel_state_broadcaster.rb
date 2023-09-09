# frozen_string_literal: true

module Broadcasters
  module CustomDuels
    class DuelStateBroadcaster < BaseBroadcaster
      def self.broadcast_to(duel)
        participants_ranking = CustomDuelRanksQuery.call(duel)

        Turbo::StreamsChannel.broadcast_update_to(
          "#{dom_id(duel)}_summary",
          target: "#{dom_id(duel)}_summary",
          content: render_template('summaries/ranking', { participants_ranking: participants_ranking })
        )
      end
    end
  end
end
