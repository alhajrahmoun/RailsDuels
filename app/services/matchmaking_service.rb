class MatchmakingService
  def self.call(current_user)
    opponent = User.where(status: :in_queue)
                   .where.not(id: current_user.id)
                   .first

    if opponent.present?
      current_user_match_template = ApplicationController.render(
        partial: 'matchmaking/match_found',
        locals: { opponent: opponent }
      )

      opponent_match_template = ApplicationController.render(
        partial: 'matchmaking/match_found',
        locals: { opponent: current_user }
      )

      current_user_channel = "queue_#{current_user.level}_#{current_user.id}"
      opponent_channel = "queue_#{opponent.level}_#{opponent.id}"

      Turbo::StreamsChannel.broadcast_replace_to(
        current_user_channel,
        target: 'match',
        content: current_user_match_template
      )

      Turbo::StreamsChannel.broadcast_remove_to(
        current_user_channel,
        target: 'cancellation-section'
      )

      Turbo::StreamsChannel.broadcast_replace_to(
        opponent_channel,
        target: 'match',
        content: opponent_match_template
      )

      Turbo::StreamsChannel.broadcast_remove_to(
        opponent_channel,
        target: 'cancellation-section'
      )
    else
      no_match = ApplicationController.render(
        partial: 'matchmaking/no_match_found'
      )

      current_user_channel = "queue_#{current_user.level}_#{current_user.id}"

      Turbo::StreamsChannel.broadcast_replace_to(
        current_user_channel,
        target: 'match',
        content: no_match
      )
    end
  end
end