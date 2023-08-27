# frozen_string_literal: true

FactoryBot.define do
  factory :problem_set do
    name { 'Problem Set 1' }
    complexity { ProblemSet.complexities.values.sample }
  end
end
