# frozen_string_literal: true

class MatchmakingService
  attr_reader :duel

  def self.call(current_user)
    @current_user = current_user
    @opponent = MatchmakingQuery.call(current_user)

    if @opponent.present?
      service = DuelsService.call(participants: [@current_user, @opponent])

      if service
        @duel = service
        ProblemsService.call(duel: @duel, complexity: @current_user.level)
        match_found
      else
        no_match_found
      end
    else
      no_match_found
    end
  end

  class << self
    attr_reader :current_user, :opponent, :duel

    private

    def match_found
      Broadcasters::MatchFoundBroadcaster.broadcast_to(duel, current_user, opponent)
    end

    def no_match_found
      Broadcasters::NoMatchBroadcaster.broadcast_to(current_user)
    end
  end
end
