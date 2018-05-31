class AddLastReflectionOnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_reflection_on, :date
  end
end
