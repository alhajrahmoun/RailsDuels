class RemoveUserIdsFromDuels < ActiveRecord::Migration[7.0]
  def change
    remove_column :duels, :user_1_id, :bigint
    remove_column :duels, :user_2_id, :bigint
  end
end
