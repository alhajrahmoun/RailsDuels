# frozen_string_literal: true

module Broadcasters
  class DuelStateBroadcaster < BaseBroadcaster
    def self.broadcast_to(duel)
      Turbo::StreamsChannel.broadcast_update_to(
        "#{dom_id(duel)}_summary",
        target: "#{dom_id(duel)}_summary",
        content: render_template('summaries/summary', { duel: duel })
      )
    end
  end
end
