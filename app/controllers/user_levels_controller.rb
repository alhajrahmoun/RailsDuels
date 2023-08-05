# frozen_string_literal: true

class UserLevelsController < ApplicationController
  def edit; end

  def update
    if current_user.update(user_level_params)
      flash[:notice] = 'Your level was successfully updated.'
      redirect_to profile_path
    else
      flash[:alert] = 'There was a problem updating your level.'
      render :edit
    end
  end

  private

  def user_level_params
    params.require(:user).permit(:level)
  end
end
