# spec/factories/duels.rb
FactoryBot.define do
  factory :duel do
    user_1 { build(:user) }
    user_2 { build(:user) }
    winner { nil }
    state { :starting }

    # after(:create) do |duel|
    #   create_list(:problem, 3, duels: [duel])
    # end
  end
end