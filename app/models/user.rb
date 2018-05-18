class User < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  has_many   :questions,
             :dependent => :destroy

  # Indirect associations

  # Validations
  
  
  validates :time_zone, presence: true
  validates :phone_number, uniqueness: true
  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
