class User < ApplicationRecord
  has_many :tutors
  has_many :clinics
  has_many :vets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
