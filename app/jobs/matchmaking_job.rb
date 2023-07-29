class MatchmakingJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    MatchmakingService.call(current_user)
  end
end