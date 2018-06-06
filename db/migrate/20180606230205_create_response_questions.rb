class CreateResponseQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :response_questions do |t|
      t.string :response_question_text

      t.timestamps
    end
  end
end
