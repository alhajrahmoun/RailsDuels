# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :duel
  belongs_to :problem

  before_save :set_points
  after_create_commit :update_duel_progress

  def set_points
    self.points = choice == problem.answer ? problem.points : 0
  end

  def update_duel_progress
    Broadcasters::DuelProgressBroadcaster.broadcast_to(duel, user)
  end
end
