class AddEnabledToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :enabled, :binary
  end
end
