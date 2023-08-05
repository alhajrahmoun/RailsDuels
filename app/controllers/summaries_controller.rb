# frozen_string_literal: true

class SummariesController < ApplicationController
  def show
    @duel = Duel.find(params[:id])

    DuelSummaryService.new(@duel).call
  end
end
