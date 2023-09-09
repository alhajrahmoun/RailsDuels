# frozen_string_literal: true

class CustomDuelService
  def self.call(user, options:)
    problem_set_id = options[:problem_set_id]
    problem_set = ProblemSet.find_by(id: problem_set_id)
    complexity = problem_set.complexity

    duel = CustomDuel.create(problem_set: problem_set, complexity: complexity)
    duel.users << user
    duel.update(leader: user)
    duel
  end
end
