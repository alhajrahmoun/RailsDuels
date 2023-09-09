# frozen_string_literal: true

class CustomDuelStartController < ApplicationController
  before_action :authenticate_user!

  def update
    @custom_duel = CustomDuel.find(params[:id])

    if @custom_duel.users.many?
      @custom_duel.update!(state: :ongoing)
    else
      flash[:alert] = 'You need at least 2 participants to start a duel'
      redirect_back(fallback_location: custom_duel_path(@custom_duel))
    end
  end
end
