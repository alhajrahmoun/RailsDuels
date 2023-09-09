class RemoveComplexityFromProblems < ActiveRecord::Migration[7.0]
  def change
    ProblemSet.create(name: "Beginner", complexity: 0)
    ProblemSet.create(name: "intermediate", complexity: 1)
    ProblemSet.create(name: "advanced", complexity: 2)
    ProblemSet.create(name: "expert", complexity: 3)

    Problem.all.each do |problem|
      problem.problem_set = ProblemSet.find_by(complexity: problem.complexity)
      problem.save!
    end

    remove_column :problems, :complexity, :integer
    change_column_null :problems, :problem_set_id, false
  end
end
