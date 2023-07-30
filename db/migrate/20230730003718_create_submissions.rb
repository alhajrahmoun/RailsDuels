class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :duel, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.string :choice
      t.integer :points

      t.timestamps
    end
  end
end
