class AddProblemSetIdToProblems < ActiveRecord::Migration[7.0]
  def change
    add_reference :problems, :problem_set, null: true, foreign_key: true
  end
end
