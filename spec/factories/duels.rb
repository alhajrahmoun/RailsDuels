# frozen_string_literal: true

# spec/factories/duels.rb
FactoryBot.define do
  factory :duel do
    winner { nil }
    state { :starting }

    after(:create) do |duel|
      create_list(:duel_participant, 2, duel: duel) do |duel_participant|
        duel_participant.update(user: create(:user))
      end
    end

    trait :custom_duel do
      type { 'CustomDuel' }
    end

    factory :custom_duel, traits: [:custom_duel], class: 'CustomDuel'
  end
end
