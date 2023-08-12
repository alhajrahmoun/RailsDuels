# frozen_string_literal: true

# spec/factories/submissions.rb

FactoryBot.define do
  factory :submission do
    user
    duel
    problem
    choice { problem.answer }
  end
end
