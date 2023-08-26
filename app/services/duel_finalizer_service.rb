# frozen_string_literal: true

class DuelFinalizerService
  attr_reader :duel, :user_1, :user_2

  def initialize(duel)
    @duel = duel
    @user_1, @user_2 = duel.users
  end

  def call
    return if duel_finished_or_not_enough_submissions?

    set_users_status_to_idle

    user_1_points, user_2_points = calculate_points

    update_points_and_winner(user_1_points, user_2_points)
  end

  private

  def duel_finished_or_not_enough_submissions?
    duel.finished? || duel.submissions.count < 10
  end

  def set_users_status_to_idle
    [user_1, user_2].each { |user| user.update!(status: :idle) }
  end

  def calculate_points
    user_1_points = sum_points(user_1)
    user_2_points = sum_points(user_2)

    if user_1_points.nonzero? && user_2_points.nonzero?
      adjust_points_based_on_last_submission(user_1_points, user_2_points)
    end

    [user_1_points, user_2_points]
  end

  def update_points_and_winner(user_1_points, user_2_points)
    define_winner_and_increment_points(user_1_points, user_2_points)

    duel.update(state: :finished)
  end

  def sum_points(user)
    user.submissions.where(duel: duel).sum(:points)
  end

  def last_submission_time(user)
    user.submissions.where(duel: duel).maximum(:created_at)
  end

  def adjust_points_based_on_last_submission(user_1_points, user_2_points)
    if last_submission_time(user_1) > last_submission_time(user_2)
      user_2_points += 5
    elsif last_submission_time(user_2) > last_submission_time(user_1)
      user_1_points += 5
    end
    [user_1_points, user_2_points]
  end

  def define_winner_and_increment_points(user_1_points, user_2_points)
    if user_1_points > user_2_points
      increment_points_and_set_winner(user_1, user_1_points)
    elsif user_2_points > user_1_points
      increment_points_and_set_winner(user_2, user_2_points)
    else
      increment_points(user_1, user_1_points)
      increment_points(user_2, user_2_points)
      duel.update!(winner: nil, winner_points: user_1_points)
    end
  end

  def increment_points(user, points)
    user.increment!(:points, points)
  end

  def increment_points_and_set_winner(user, points)
    increment_points(user, points)
    duel.update!(winner: user, winner_points: points)
  end
end
