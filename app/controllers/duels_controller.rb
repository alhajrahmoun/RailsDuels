# frozen_string_literal: true

class DuelsController < ApplicationController
  before_action :authenticate_user!

  def show
    @duel = Duel.find(params[:id])

    authorize @duel

    current_user.update(status: :in_duel)
  end
end
