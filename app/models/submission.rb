class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :duel
  belongs_to :problem

  before_save :set_points
  after_create_commit :update_duel_progress

  def set_points
    if choice == self.problem.answer
      self.points = self.problem.points
    else
      self.points = 0
    end
  end

  def update_duel_progress
    Turbo::StreamsChannel.broadcast_update_to(
      "duel_progress_#{duel.id}",
      target: "user_#{user_id}_progress",
      content: ApplicationController.render(partial: "duels/user_progress", locals: { user: user, duel: duel })
    )
  end
end
