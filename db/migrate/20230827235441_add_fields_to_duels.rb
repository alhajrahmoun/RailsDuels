class AddFieldsToDuels < ActiveRecord::Migration[7.0]
  def change
    add_column :duels, :type, :string, default: 'Duel'
    add_column :duels, :private, :boolean, default: true
    add_column :duels, :invitation_code, :string
    add_column :duels, :leader_id, :integer
    add_reference :duels, :problem_set, null: true, foreign_key: true
  end
end
