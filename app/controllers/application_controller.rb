# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { static_page? || ranks_page? }
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

  def ranks_page?
    is_a?(RanksController)
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'

    redirect_back(fallback_location: root_path)
  end

  def record_not_found
    flash[:alert] = 'You are not authorized to perform this action.'

    redirect_back(fallback_location: root_path)
  end
end
