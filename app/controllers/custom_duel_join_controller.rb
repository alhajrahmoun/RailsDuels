# frozen_string_literal: true

class CustomDuelJoinController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_level, only: %i[show]

  def show
    @duel = CustomDuel.find_by(id: params[:id], invitation_code: params[:code])

    return redirect_to root_path, alert: I18n.t('errors.messages.duel_not_found') if @duel.nil?

    @duel.duel_participants.create(user: current_user)

    redirect_to custom_duel_path(@duel)
  end
end
