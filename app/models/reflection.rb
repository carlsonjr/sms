class Reflection < ApplicationRecord
#associations
    belongs_to :user
    has_many   :reflection_answers,
             :dependent => :destroy
    
    
#Validations
    validates :user_id, presence: true



end
