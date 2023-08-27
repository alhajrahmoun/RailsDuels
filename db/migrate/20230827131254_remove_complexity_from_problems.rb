class RemoveComplexityFromProblems < ActiveRecord::Migration[7.0]
  def change
    remove_column :problems, :complexity, :integer
  end
end
