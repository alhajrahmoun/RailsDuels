# frozen_string_literal: true

class Problem < ApplicationRecord
  has_many :submissions
  has_many :duel_problems
  has_many :duels, through: :duel_problems

  belongs_to :problem_set
end
