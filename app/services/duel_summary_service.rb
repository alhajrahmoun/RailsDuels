class DuelSummaryService
  def initialize(duel)
    @duel = duel
  end

  def call
    return if @duel.finished?

    @duel.update(state: :finished)
    @duel.user_1.update(status: :idle)
    @duel.user_2.update(status: :idle)

    user_1_points = @duel.user_1.submissions.where(duel: @duel).sum(:points)
    @duel.user_1.increment(:points, user_1_points)
    user_2_points = @duel.user_2.submissions.where(duel: @duel).sum(:points)
    @duel.user_2.increment(:points, user_2_points)

    if user_1_points > user_2_points
      @duel.update(winner: @duel.user_1, winner_points: user_1_points)
    elsif user_2_points > user_1_points
      @duel.update(winner: @duel.user_2, winner_points: user_2_points)
    end
  end
end