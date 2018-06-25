class User < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  has_many   :questions,
             :dependent => :destroy
             
  has_many :reflections,
             :dependent => :destroy

  has_many :reflection_questions,
             :dependent => :destroy
             
  # Indirect associations

  has_many :reflection_answers, through: :reflection_questions


  # Validations
  
  
  validates :time_zone, presence: true
  validates :phone_number, uniqueness: true
  validates :phone_number, length: {:is => 10}
  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
