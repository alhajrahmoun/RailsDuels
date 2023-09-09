# frozen_string_literal: true

class UserLevelsController < ApplicationController
  def edit; end

  def update
    if current_user.update(user_level_params)
      flash[:notice] = I18n.t('actions.success')

      redirect_to settings_path
    else
      flash[:alert] = I18n.t('actions.failure')

      render :edit
    end
  end

  private

  def user_level_params
    params.require(:user).permit(:level)
  end
end
