# frozen_string_literal: true

FactoryBot.define do
  factory :duel_participation do
    duel
    user
  end
end
