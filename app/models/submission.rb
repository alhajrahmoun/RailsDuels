# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :duel
  belongs_to :problem

  before_save :set_points
  after_create_commit :update_duel_progress

  def set_points
    extra_points = if duel.custom?
                     problem.submissions.where(duel: duel).empty? ? duel.extra_points : 0
                   else
                     0
                   end

    self.points = choice == problem.answer ? problem.points + extra_points : 0
  end

  def update_duel_progress
    if duel.custom?
      Broadcasters::CustomDuels::DuelPointsBroadcaster.broadcast_to(duel, user)
      Broadcasters::CustomDuels::DuelProgressBroadcaster.broadcast_to(duel)
    else
      Broadcasters::DuelProgressBroadcaster.broadcast_to(duel, user)
    end
  end
end
