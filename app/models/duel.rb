# frozen_string_literal: true

class Duel < ApplicationRecord
  DuelDetails = Struct.new(:points, :submissions, :correct_answers)

  has_many :duel_problems
  has_many :problems, through: :duel_problems
  has_many :submissions

  has_many :duel_participations
  has_many :users, through: :duel_participations

  belongs_to :winner, class_name: 'User', optional: true

  enum state: { starting: 0, ongoing: 1, finished: 2 }

  after_update_commit :broadcast_state_change, if: -> { finished? }

  def complexity
    problems.first&.complexity
  end

  def initial_state
    DuelDetails.new(points: 0, submissions: 0, correct_answers: 0)
  end

  def user_state(user)
    user_submissions = submissions.where(user: user)

    return initial_state if user_submissions.empty?

    points = user_submissions.sum(&:points)
    submissions_count = submissions.where(user: user).size

    DuelDetails.new(
      points: points,
      submissions: submissions_count,
      correct_answers: user_submissions.count { |submission| submission.points.positive? }
    )
  end

  def broadcast_state_change
    Turbo::StreamsChannel.broadcast_update_to(
      "duel_#{id}_summary",
      target: "duel_#{id}_summary",
      content: ApplicationController.render(partial: 'summaries/summary', locals: { duel: self })
    )
  end
end
