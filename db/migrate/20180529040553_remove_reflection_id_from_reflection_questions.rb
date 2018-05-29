class RemoveReflectionIdFromReflectionQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :reflection_questions, :reflection_id, :integer
  end
end
