class ReflectionQuestion < ApplicationRecord
#Associations
    belongs_to :user
    has_many :reflection_answers
    
    
#Validations
    validates :user_id, :reflection_question_text, presence: true


end
