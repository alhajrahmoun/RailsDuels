class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :static_page?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def static_page?
    is_a?(StaticPagesController)
  end
end
