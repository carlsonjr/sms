class AddPreviousReflectionDateToReflections < ActiveRecord::Migration[5.0]
  def change
    add_column :reflections, :previous_reflection_date, :datetime
  end
end
