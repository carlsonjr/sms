class AddMissingTables < ActiveRecord::Migration[5.0]
  def change
      create_table :reflection_answers do |t|
      t.integer :reflection_question_id
      t.integer :reflection_id
      t.string :reflection_answer_text
      
      t.timestamps

    end
    
    create_table :reflection_questions do |t|
      t.integer :user_id
      t.string :reflection_question_text
      
      t.timestamps

    end
    
      create_table :reflections do |t|
      t.integer :user_id
      t.integer :reflection_interval
      t.date :last_reflection_on
      
      t.timestamps

    end
    
    
  end
end
