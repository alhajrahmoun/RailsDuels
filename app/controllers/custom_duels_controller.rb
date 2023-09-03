# frozen_string_literal: true

class CustomDuelsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_level, only: %i[show new]

  def index
    @duels = CustomDuel.all.includes(:users)
  end

  def show
    @duel = CustomDuel.find_by(id: params[:id])

    @participant = @duel.duel_participants.find_by(user: current_user)

    redirect_to root_path, alert: 'Duel not found' if @duel.nil?
  end

  def new
    @duel = CustomDuel.new
  end

  def edit
    @duel = CustomDuel.find_by(id: params[:id])
  end

  def create
    @duel = CustomDuelService.call(current_user, options: duel_params)

    if @duel.errors.blank?
      redirect_to custom_duel_path(@duel)
    else
      redirect_to custom_duels_path, alert: @duel.errors.full_messages.join(', ')
    end
  end

  def update
    @duel = CustomDuel.find_by(id: params[:id])

    if @duel.update(duel_params)
      redirect_to custom_duel_path(@duel)
    else
      redirect_to custom_duels_path, alert: @duel.errors.full_messages.join(', ')
    end
  end

  private

  def duel_params
    params.require(:custom_duel).permit(:private, :problem_set_id)
  end
end
