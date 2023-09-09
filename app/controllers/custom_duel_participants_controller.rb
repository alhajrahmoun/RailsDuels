# frozen_string_literal: true

class CustomDuelParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_duel

  def create
    @duel_participant = @duel.duel_participants.new(user: current_user)

    if @duel_participant.save
      redirect_to custom_duel_path(@duel)
    else
      redirect_to custom_duel_path(@duel), alert: @duel_participant.errors.full_messages.join(', ')
    end
  end

  def destroy
    @duel_participant = @duel.duel_participants.find_by(user: current_user)

    return unless @duel_participant.destroy

    @duel.destroy if @duel.duel_participants.empty?

    redirect_to custom_duels_path, notice: I18n.t('hints.user_left_duel')
  end

  private

  def set_duel
    @duel = Duel.find_by(id: params[:custom_duel_id])
  end
end
