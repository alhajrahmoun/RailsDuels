# spec/factories/duel_problems.rb

FactoryBot.define do
  factory :duel_problem do
    duel { build(:duel) }
    problem { build(:problem) }
  end
end