class AddComplexityToDuels < ActiveRecord::Migration[7.0]
  def change
    add_column :duels, :complexity, :string
  end
end
