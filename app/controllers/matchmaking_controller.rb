class MatchmakingController < ApplicationController
  before_action :check_user_level, only: [:show]

  def show
    @in_queue_users = QueueSizeQuery.call(current_user.level)
    @user_rank = UserRankQuery.call(current_user.id).rank
  end

  def create
    if current_user.update(status: :in_queue)
      MatchmakingJob.set(wait: 2.seconds).perform_later(current_user)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to matchmaking_path }
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user.update(status: :online)
      redirect_to root_path
    end
  end

  private

  def check_user_level
    redirect_to edit_user_level_path if current_user.level.nil?
  end
end
