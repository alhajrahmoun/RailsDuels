# frozen_string_literal: true

class DuelPolicy
  attr_reader :user, :duel

  def initialize(user, duel)
    @user = user
    @duel = duel
  end

  def show?
    duel.user_ids.include?(user.id)
  end
end
