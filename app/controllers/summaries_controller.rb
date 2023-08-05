class SummariesController < ApplicationController
  def show
    @duel = Duel.find(params[:id])

    DuelFinalizerService.new(@duel).call
  end
end