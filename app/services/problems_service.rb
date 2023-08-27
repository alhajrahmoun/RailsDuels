# frozen_string_literal: true

class ProblemsService
  def self.call(duel:, complexity:)
    problem_set = ProblemSet.find_by(user_id: nil, complexity: complexity)

    problems = problem_set.problems
                          .order('RANDOM()')
                          .limit(5)

    duel.problems << problems
  end
end
