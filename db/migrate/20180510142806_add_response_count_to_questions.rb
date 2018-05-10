class AddResponseCountToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :responses_count, :integer
  end
end
