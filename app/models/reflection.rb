class Reflection < ApplicationRecord
#associations
    belongs_to :user
    
#Validations
    validates :user_id, presence: true



end
