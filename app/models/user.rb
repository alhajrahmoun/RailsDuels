# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  enum level: { beginner: 0, intermediate: 1, advanced: 2, expert: 3 }
  enum status: { idle: 0, in_queue: 1, in_duel: 2 }

  scope :online, -> { where(online: true) }

  has_many :user_1_duels, class_name: 'Duel', foreign_key: 'user_1_id', inverse_of: :user_1
  has_many :user_2_duels, class_name: 'Duel', foreign_key: 'user_2_id', inverse_of: :user_2
  has_many :duel_participations
  has_many :duels, through: :duel_participations
  has_many :submissions
  has_many :problems, through: :submissions

  after_update_commit :update_queue_status, if: :went_offline?
  after_update_commit :reset_points, if: :saved_change_to_level?

  def reset_points
    update(points: 0)
  end

  def went_offline?
    saved_change_to_online? && offline?
  end

  def offline?
    !online?
  end

  def problems_without_submissions(duel_id:)
    # Find all problem ids for a duel
    duel_problem_ids = DuelProblem.where(duel_id: duel_id).pluck(:problem_id)

    # Find all problem ids for which user has made a submission in the duel
    submitted_problems_ids = submissions.where(duel_id: duel_id).pluck(:problem_id)

    # Find all problems that are in the duel but the user has not made a submission for
    Problem.where(id: duel_problem_ids - submitted_problems_ids)
  end

  def update_queue_status
    return unless reload && in_queue?

    update(status: :idle)
  end
end
