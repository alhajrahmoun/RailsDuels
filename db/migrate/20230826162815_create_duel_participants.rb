class CreateDuelParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :duel_participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :duel, null: false, foreign_key: true

      t.timestamps
    end

    add_index :duel_participants, %i[user_id duel_id], unique: true

    Duel.all.find_each do |duel|
      duel.users << [duel.user_1, duel.user_2]
    end
  end
end
