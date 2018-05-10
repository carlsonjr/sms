class Question < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :nullify

  belongs_to :user

  # Indirect associations

  # Validations

end
