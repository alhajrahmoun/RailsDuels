class AddPointsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :points, :integer, default: 0

    add_index :users, :points, order: { points: :desc }
  end
end
