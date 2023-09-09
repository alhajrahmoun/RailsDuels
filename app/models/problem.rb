# frozen_string_literal: true

class Problem < ApplicationRecord
  has_many :submissions
  has_many :duel_problems
  has_many :duels, through: :duel_problems

  belongs_to :problem_set

  validates :description, :points, :answer, presence: true
  validate :answer_matches_choice
  validate :choices_count

  def answer_matches_choice
    return if choices.include?(answer)

    errors.add(:answer, 'must be one of the choices')
  end

  def choices_count
    return if choices.count <= 4 && choices.count >= 2

    errors.add(:choices, 'must be at least two')
  end
end
