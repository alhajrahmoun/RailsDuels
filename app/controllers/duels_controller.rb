# frozen_string_literal: true

class DuelsController < ApplicationController
  before_action :authenticate_user!

  def show
    @duel = Duel.find(params[:id])

    @user_1, @user_2 = @duel.users

    authorize @duel

    current_user.update(status: :in_duel)
  end
end
