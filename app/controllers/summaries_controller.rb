# frozen_string_literal: true

class SummariesController < ApplicationController
  def show
    @duel = Duel.find(params[:id])

    if @duel.custom?
      @participants_ranking = CustomDuelRanksQuery.call(@duel)

      CustomDuelFinalizerService.new(@duel).call
    else
      DuelFinalizerService.new(@duel).call
    end
  end
end
