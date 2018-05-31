class RemoveLastReflectionOnFromReflections < ActiveRecord::Migration[5.0]
  def change
    remove_column :reflections, :last_reflection_on, :date
  end
end
