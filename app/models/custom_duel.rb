# frozen_string_literal: true

class CustomDuel < Duel
  MAX_PARTICIPANTS = 20

  belongs_to :problem_set, optional: true
  belongs_to :leader, class_name: 'User', optional: true

  before_create :set_invitation_code
  after_update_commit :broadcast_match_starting, if: -> { state_previously_changed?(to: 'ongoing') }
  after_update_commit :assign_problems, if: -> { ongoing? && problems.empty? }

  def set_invitation_code
    loop do
      self.invitation_code = SecureRandom.hex(4)
      break unless self.class.exists?(invitation_code: invitation_code)
    end
  end

  def assign_problems
    CustomDuelProblemsService.call(duel: self)
  end

  def broadcast_state_change
    Broadcasters::CustomDuels::DuelStateBroadcaster.broadcast_to(self)
  end

  def broadcast_match_starting
    Broadcasters::CustomDuels::MatchStartingBroadcaster.broadcast_to(self)
  end

  def custom?
    true
  end
end
