class CreateDuelParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :duel_participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :duel, null: false, foreign_key: true

      t.timestamps
    end

    Duel.all.find_each do |duel|
      duel.duel_participations.create!(user: [duel.user_1, duel.user_2])
    end
  end
end
