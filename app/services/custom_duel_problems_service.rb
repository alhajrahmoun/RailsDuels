# frozen_string_literal: true

class CustomDuelProblemsService
  def self.call(duel:)
    problems = duel.problem_set.problems.order('RANDOM()')

    duel.problems << problems
  end
end
