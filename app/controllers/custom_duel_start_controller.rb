# frozen_string_literal: true

class CustomDuelStartController < ApplicationController
  before_action :authenticate_user!

  def update
    @custom_duel = CustomDuel.find(params[:id])

    if @custom_duel.users.many?
      @custom_duel.update!(state: :ongoing, start_at: 10.seconds.from_now)
    else
      flash[:alert] = I18n.t('errors.messages.not_enough_participants')

      redirect_back(fallback_location: custom_duel_path(@custom_duel))
    end
  end
end
