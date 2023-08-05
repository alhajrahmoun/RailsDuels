# spec/factories/submissions.rb

FactoryBot.define do
  factory :submission do
    user { build(:user) }
    duel { build(:duel) }
    problem { build(:problem) }
    choice { problem.answer }
  end
end