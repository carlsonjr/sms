class ReflectionAnswer < ApplicationRecord
#Associations
    belongs_to :reflection_question
    belongs_to :reflection

#validations
    validates :reflection_question_id, :reflection_id, :reflection_answer_text, presence: true

end
