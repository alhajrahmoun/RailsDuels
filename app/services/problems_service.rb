class ProblemsService
  def self.call(duel:, complexity:)
    @problems = Problem.where(complexity: complexity)
                       .order('RANDOM()')
                       .limit(5)

    duel.problems << @problems
  end
end