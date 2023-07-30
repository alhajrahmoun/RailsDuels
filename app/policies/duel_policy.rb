class DuelPolicy
  attr_reader :user, :duel

  def initialize(user, duel)
    @user = user
    @duel = duel
  end

  def show?
    duel.user_1_id == user.id || duel.user_2_id == user.id
  end
end