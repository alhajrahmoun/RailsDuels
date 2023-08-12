# frozen_string_literal: true

class Problem < ApplicationRecord
  has_many :submissions
  has_many :duel_problems
  has_many :duels, through: :duel_problems

  enum complexity: { beginner: 0, intermediate: 1, advanced: 2, expert: 3 }
end
