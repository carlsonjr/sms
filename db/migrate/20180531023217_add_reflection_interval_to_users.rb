class AddReflectionIntervalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reflection_interval, :integer
  end
end
