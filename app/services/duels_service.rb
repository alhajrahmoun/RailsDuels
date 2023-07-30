class DuelsService
  def initialize(user_1:, user_2:)
    @user_1 = user_1
    @user_2 = user_2
  end

  def call
    Duel.create(user_1: @user_1, user_2: @user_2)
  end
end