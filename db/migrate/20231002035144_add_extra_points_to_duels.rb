class AddExtraPointsToDuels < ActiveRecord::Migration[7.0]
  def change
    add_column :duels, :extra_points, :integer, default: 1
  end
end
