class Problem < ApplicationRecord
  has_many :submissions
  has_many :duel_problems
  has_many :duels, through: :duel_problems

  enum complexity: [:beginner, :intermediate, :advanced, :expert]
end
