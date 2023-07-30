class DuelsService
  def self.call(user_1:, user_2:)
    Duel.create(user_1: user_1, user_2: user_2, state: :starting)
  end
end