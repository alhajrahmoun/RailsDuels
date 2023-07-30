class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Your profile was successfully updated.'
      redirect_to profile_path
    else
      flash[:alert] = 'There was a problem updating your profile.'
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:level)
  end
end