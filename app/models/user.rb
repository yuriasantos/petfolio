class User < ApplicationRecord
  has_one :tutor
  has_one :clinic
  has_one :vet

  validates :email, :password, :role, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
