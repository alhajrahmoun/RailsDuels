class RemoveAhoy < ActiveRecord::Migration[7.1]
  def change
    drop_table :ahoy_events, if: table_exists?(:ahoy_events)
    drop_table :ahoy_visits, if: table_exists?(:ahoy_visits)
  end
end
