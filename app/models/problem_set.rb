# frozen_string_literal: true

class ProblemSet < ApplicationRecord
  has_many :problems, dependent: :destroy
  belongs_to :user, optional: true

  validates :name, :complexity, presence: true

  enum complexity: { beginner: 0, intermediate: 1, advanced: 2, expert: 3 }
end
