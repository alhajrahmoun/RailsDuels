class ProblemSet < ApplicationRecord
  has_many :problems
  belongs_to :user, optional: true

  enum complexity: { beginner: 0, intermediate: 1, advanced: 2, expert: 3 }
end
