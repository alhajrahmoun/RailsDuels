class AddComplexityToDuels < ActiveRecord::Migration[7.0]
  def change
    add_column :duels, :complexity, :string

    Duel.where.not(id:  1).each do |duel|
      duel.update_columns(complexity: duel.problems.first.problem_set.complexity)
    end
  end
end
