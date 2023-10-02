# frozen_string_literal: true

class UserDuelsController < ApplicationController
  def index
    @pagy, @user_duels = pagy(current_user.duels.includes(:winner))
  end
end
