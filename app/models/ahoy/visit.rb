# frozen_string_literal: true

module Ahoy
  class Visit < ApplicationRecord
    include AhoyCaptain::Ahoy::VisitMethods
    self.table_name = 'ahoy_visits'

    has_many :events, class_name: 'Ahoy::Event'
    belongs_to :user, optional: true
  end
end
