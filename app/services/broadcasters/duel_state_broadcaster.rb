# frozen_string_literal: true

module Broadcasters
  class DuelStateBroadcaster < BaseBroadcaster
    def self.broadcast_to(duel)
      Turbo::StreamsChannel.broadcast_update_to(
        "duel_#{duel.id}_summary",
        target: "duel_#{duel.id}_summary",
        content: render_template('summaries/summary', { duel: duel })
      )
    end
  end
end

