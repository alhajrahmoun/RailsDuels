class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  enum level: [:beginner, :intermediate, :advanced, :expert]
  enum status: [:idle, :in_queue, :in_duel]

  scope :online, -> { where(online: true) }

  has_many :user_1_duels, class_name: 'Duel', foreign_key: 'user_1_id'
  has_many :user_2_duels, class_name: 'Duel', foreign_key: 'user_2_id'
  has_many :duels
  has_many :won_duels, class_name: 'Duel', foreign_key: 'winner_id'
  has_many :submissions
  has_many :problems, through: :submissions

  def duels
    user_1_duels.or(user_2_duels)
  end

  def problems_without_submissions(duel_id:)
    # Find all problem ids for a duel
    duel_problem_ids = DuelProblem.where(duel_id: duel_id).pluck(:problem_id)

    # Find all problem ids for which user has made a submission in the duel
    submitted_problems_ids = submissions.where(duel_id: duel_id).pluck(:problem_id)

    # Find all problems that are in the duel but the user has not made a submission for
    Problem.where(id: duel_problem_ids - submitted_problems_ids)
  end
end
