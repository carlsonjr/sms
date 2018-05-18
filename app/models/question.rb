class Question < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :nullify

  belongs_to :user
  validates :question, presence: true 
  

  # Indirect associations

  # Validations

end
