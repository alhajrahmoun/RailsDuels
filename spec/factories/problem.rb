# frozen_string_literal: true

# spec/factories/problems.rb

FactoryBot.define do
  factory :problem do
    problem_set
    sequence(:description) { |n| "Description of problem #{n}" }
    points { 10 }
    choices { %w[choice1 choice2 choice3 choice4] }
    answer { choices.sample }
  end
end
