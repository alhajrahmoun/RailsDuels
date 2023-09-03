# frozen_string_literal: true

FactoryBot.define do
  factory :duel_participant do
    duel
    user
  end
end
