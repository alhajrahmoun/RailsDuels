# frozen_string_literal: true

class LeaderboardController < ApplicationController
  def index; end

  def show
    @users_ranking = RanksQuery.call(limit: 10, level: params[:level])

    return unless current_user
    return unless current_user.level == params[:level]

    @user_rank = UserRankRecordQuery.call(current_user)

    return if @user_rank.rank < 10

    @users_ranking = @users_ranking.to_a
    @users_ranking << @user_rank
  end
end
