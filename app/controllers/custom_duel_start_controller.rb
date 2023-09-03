# frozen_string_literal: true

class CustomDuelStartController < ApplicationController
  before_action :authenticate_user!

  def update
    @custom_duel = CustomDuel.find(params[:id])

    @custom_duel.update!(state: :ongoing)
  end
end
