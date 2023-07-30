class Duel < ApplicationRecord
  has_many :duel_problems
  has_many :problems, through: :duel_problems
  has_many :submissions

  belongs_to :user_1, class_name: 'User', foreign_key: 'user_1_id'
  belongs_to :user_2, class_name: 'User', foreign_key: 'user_2_id'
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id', optional: true

  enum state: [:starting, :ongoing, :finished]

  def initial_state
    hash = {
      points: 0,
      submissions: 0,
      correct_answers: 0,
    }

    OpenStruct.new(hash)
  end

  def user_state(user)
    user_submissions = submissions.where(user: user)

    return initial_state if user_submissions.empty?

    points = user_submissions.sum(&:points)
    submissions_count = submissions.where(user: user).size

    hash = {
      points: points,
      submissions: submissions_count,
      correct_answers: user_submissions.select { |submission| submission.points > 0 }.size,
    }

    OpenStruct.new(hash)
  end
end
