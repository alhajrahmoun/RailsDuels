class AddWinnerIdToDuels < ActiveRecord::Migration[7.0]
  def change
    add_column :duels, :winner_id, :integer, foreign_key_for: :users
    add_column :duels, :winner_points, :integer

    add_index :duels, :winner_id
  end
end
