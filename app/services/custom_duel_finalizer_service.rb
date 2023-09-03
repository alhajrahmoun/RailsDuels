# frozen_string_literal: true

class CustomDuelFinalizerService
  attr_reader :duel, :users

  def initialize(duel)
    @duel = duel
    @users = duel.users
  end

  def call
    return if duel_finished_or_not_enough_submissions?

    set_users_status_to_idle

    scores = calculate_points

    update_points_and_winner(scores)
  end

  private

  def duel_finished_or_not_enough_submissions?
    duel.finished? || duel.submissions.count < duel.problems.count * duel.users.count
  end

  def set_users_status_to_idle
    users.update_all(status: :idle)
  end

  def calculate_points
    duel.submissions.group(:user_id).sum(:points)
  end

  def update_points_and_winner(scores)
    winning_points, count = scores.values.tally.max_by { |k, _v| k }

    duel.assign_attributes(state: :finished)

    if count > 1
      duel.assign_attributes(winner: nil, winner_points: winning_points)
    else
      duel.assign_attributes(winner_id: scores.key(winning_points), winner_points: winning_points)
    end

    duel.save!
  end
end
