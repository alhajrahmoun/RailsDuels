# frozen_string_literal: true

class DuelParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :duel
end
