class QueuesController < ApplicationController
  before_action :check_user_level, only: [:index]

  def index
  end

  private

  def check_user_level
    redirect_to edit_user_level_path if current_user.level.nil?
  end
end
