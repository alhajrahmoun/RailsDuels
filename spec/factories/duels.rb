# frozen_string_literal: true

# spec/factories/duels.rb
FactoryBot.define do
  factory :duel do
    user_1 factory: %i[user]
    user_2 factory: %i[user]
    winner { nil }
    state { :starting }
  end
end
