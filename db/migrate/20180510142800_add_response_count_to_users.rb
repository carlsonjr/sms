class AddResponseCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :responses_count, :integer
  end
end
