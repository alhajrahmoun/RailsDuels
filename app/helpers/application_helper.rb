# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def user_details(user)
    "#{user.username}#{user.level ? " - #{user.level}" : ''}"
  end

  def date_format(date)
    I18n.l(date, format: :long)
  end
end
