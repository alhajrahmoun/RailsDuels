# frozen_string_literal: true

# spec/factories/duels.rb
FactoryBot.define do
  factory :duel do
    winner { nil }
    state { :starting }

    after(:create) do |duel|
      create_list(:duel_participation, 2, duel: duel) do |duel_participation|
        duel_participation.update(user: create(:user))
      end
    end
  end
end
