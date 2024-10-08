# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    if current_user.update(user_params)
      flash[:notice] = I18n.t('actions.success')

      redirect_to settings_path
    else
      flash.now[:alert] = I18n.t('actions.failure')

      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:level)
  end
end
