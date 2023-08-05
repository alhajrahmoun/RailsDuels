# frozen_string_literal: true

# spec/factories/problems.rb

FactoryBot.define do
  factory :problem do
    sequence(:description) { |n| "Description of problem #{n}" }
    points { 10 }
    complexity { Problem.complexities.values.sample }
  end
end
