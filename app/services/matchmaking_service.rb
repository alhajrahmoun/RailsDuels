class MatchmakingService
  def self.call(current_user)
    @current_user = current_user
    @opponent = MatchmakingQuery.call(current_user)

    if @opponent.present?
      match_found
    else
      no_match_found
    end
  end

  private

  class << self
    attr_reader :current_user, :opponent

    def match_found
      Turbo::StreamsChannel.broadcast_replace_to(
        queue_channel(current_user),
        target: 'match',
        content: render_template('match_found', opponent: opponent)
      )

      Turbo::StreamsChannel.broadcast_remove_to(
        queue_channel(current_user),
        target: 'cancellation-section'
      )

      Turbo::StreamsChannel.broadcast_replace_to(
        queue_channel(opponent),
        target: 'match',
        content: render_template('match_found', opponent: current_user)
      )

      Turbo::StreamsChannel.broadcast_remove_to(
        queue_channel(opponent),
        target: 'cancellation-section'
      )
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