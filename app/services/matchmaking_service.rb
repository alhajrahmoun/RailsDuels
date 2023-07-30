class MatchmakingService
  attr_reader :duel

  def self.call(current_user)
    @current_user = current_user
    @opponent = MatchmakingQuery.call(current_user)

    if @opponent.present?
      service = DuelsService.call(user_1: @current_user, user_2: @opponent)

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

  private

  class << self
    attr_reader :current_user, :opponent, :duel

    def match_found
      [current_user, opponent].each do |user|
        Turbo::StreamsChannel.broadcast_replace_to(
          queue_channel(user),
          target: 'match',
          content: render_template('match_found', opponent: user, duel_id: duel.id)
        )

        Turbo::StreamsChannel.broadcast_remove_to(
          queue_channel(user),
          target: 'cancellation-section'
        )
      end
    end

    def no_match_found
      Turbo::StreamsChannel.broadcast_replace_to(
        queue_channel(current_user),
        target: 'match',
        content: render_template('no_match_found')
      )
    end

    def render_template(template, locals = {})
      ApplicationController.render(
        partial: "matchmaking/#{template}",
        locals: locals
      )
    end

    def queue_channel(user)
      "queue_#{user.level}_#{user.id}"
    end
  end
end