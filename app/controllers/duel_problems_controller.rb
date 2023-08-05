# frozen_string_literal: true

class DuelProblemsController < ApplicationController
  def index
    @duel = Duel.find(params[:duel_id])

    @problems = current_user.problems_without_submissions(duel_id: @duel.id)

    if @problems.empty?
      redirect_to summary_duel_path(@duel), status: :see_other
    end
  end
end
