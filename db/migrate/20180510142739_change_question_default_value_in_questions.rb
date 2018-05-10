class ChangeQuestionDefaultValueInQuestions < ActiveRecord::Migration[5.0]
  def change
    change_column_default :questions, :question, 'What did you learn today?'
  end
end
