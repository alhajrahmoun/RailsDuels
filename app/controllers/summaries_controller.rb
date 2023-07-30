class SummariesController < ApplicationController
  def show
    @duel = Duel.find(params[:id])

    # @duel.update(state: :finished)
    # @duel.user_1.update(status: :idle)
    # @duel.user_2.update(status: :idle)
    #
    # @duel.user_1.submissions.sum(:points)
    # @duel.user_2.submissions.sum(:points)
  end
end