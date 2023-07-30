class CreateDuelProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :duel_problems do |t|
      t.references :duel, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
