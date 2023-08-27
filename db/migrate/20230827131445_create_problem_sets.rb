class CreateProblemSets < ActiveRecord::Migration[7.0]
  def change
    create_table :problem_sets do |t|
      t.string :name
      t.integer :complexity
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end

    add_index :problem_sets, :complexity
  end
end
