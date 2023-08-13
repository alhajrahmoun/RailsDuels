class AddDuelsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :duels_count, :integer, default: 0

    User.all.find_each do |user|
      User.update_counters(user.id, duels_count: user.duels.count)
    end
  end
end
