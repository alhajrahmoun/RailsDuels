# frozen_string_literal: true

class DuelsService
  def self.call(participants:)
    duel = Duel.create(state: :starting)
    duel.users << participants
    duel
  end
end
