# frozen_string_literal: true

class DuelParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :duel

  validates :user_id, uniqueness: { scope: :duel_id }

  validate :participants_count, on: :create, if: -> { duel.is_a?(CustomDuel) }

  after_commit :broadcast_participant_action, on: %i[create destroy], if: -> { duel.is_a?(CustomDuel) }

  def participants_count
    return if self.class.where(duel_id: duel_id).count <= CustomDuel::MAX_PARTICIPANTS

    errors.add(:base, 'Max participants reached')
  end

  def broadcast_participant_action
    Broadcasters::CustomDuels::ParticipantActionBroadcaster.broadcast_to(duel)
  end
end
