# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { static_page? || leaderboard_page? }
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def static_page?
    is_a?(StaticPagesController)
  end

  def leaderboard_page?
    is_a?(LeaderboardController)
  end

  private

  def user_not_authorized
    flash[:alert] = I18n.t('errors.messages.unauthorized')

    redirect_back(fallback_location: root_path)
  end

  def record_not_found
    flash[:alert] = I18n.t('errors.messages.record_not_found')

    redirect_back(fallback_location: root_path)
  end

  def check_user_level
    redirect_to edit_user_level_path if current_user.level.nil?
  end
end
