# frozen_string_literal: true

class CustomDuelProblemsService
  def self.call(duel:)
    problem_set = ProblemSet.find_by(user: duel.leader, complexity: duel.complexity)

    problems = problem_set.problems
                          .order('RANDOM()')

    duel.problems << problems
  end
end
