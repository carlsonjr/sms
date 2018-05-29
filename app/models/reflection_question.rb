class ReflectionQuestion < ApplicationRecord
#Associations
    belongs_to :reflection_question
    has_many :reflection_answers
    
    
#Validations
    validates :user_id, :reflection_id, :reflection_question_text, presence: true


end
