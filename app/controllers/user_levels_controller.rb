class UserLevelsController < ApplicationController
  def edit; end

  def update
    current_user.update(user_level_params)

    redirect_to root_path
  end

  private

  def user_level_params
    params.require(:user).permit(:level)
  end
end
