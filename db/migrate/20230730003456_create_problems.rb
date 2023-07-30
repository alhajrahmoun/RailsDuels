class CreateProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :problems do |t|
      t.string :description
      t.integer :points
      t.integer :complexity
      t.string :choices, array: true, default: []
      t.string :answer

      t.timestamps
    end
  end
end
