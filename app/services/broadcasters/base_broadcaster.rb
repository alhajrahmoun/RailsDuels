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

      def dom_id(record)
        "#{record.class.name.underscore}_#{record.id}"
      end
    end
  end
end
