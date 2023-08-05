class DuelProblem < ApplicationRecord
  belongs_to :duel
  belongs_to :problem

  scope :answered, ->(duel) { joins(problem: :submissions).where(submissions: { duel: duel }) }
end
