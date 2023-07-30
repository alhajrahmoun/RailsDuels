class CreateDuels < ActiveRecord::Migration[7.0]
  def change
    create_table :duels do |t|
      t.integer :state, default: 0
      t.references :user_1, null: false, foreign_key: { to_table: :users }
      t.references :user_2, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
