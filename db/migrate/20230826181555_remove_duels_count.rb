class RemoveDuelsCount < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :duels_count, :bigint
  end
end
