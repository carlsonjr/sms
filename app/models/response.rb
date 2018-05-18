class Response < ApplicationRecord
  # Direct associations

  belongs_to :question,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true
             
  validates :time, presence: true 

  # Indirect associations

  # Validations

end
