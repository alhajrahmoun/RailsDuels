# frozen_string_literal: true

module Broadcasters
  class BaseBroadcaster
    class << self
      private

      def render_template(template, locals = {})
        ApplicationController.render(
          partial: template,
          locals: locals
        )
      end
    end
  end
end
