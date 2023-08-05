# frozen_string_literal: true

class MatchmakingController < ApplicationController
  before_action :check_user_level, only: [:create]

  def create
    if current_user.update(status: :in_queue)
      MatchmakingJob.set(wait: 1.second).perform_later(current_user)

      @online_users = OnlineUsersQuery.call
      @current_user_rank = UserRankQuery.call(current_user.id)

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    return unless current_user.update(status: :idle)

    redirect_to root_path
  end

  private

  def check_user_level
    redirect_to edit_user_level_path if current_user.level.nil?
  end
end
