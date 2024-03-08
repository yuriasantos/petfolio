class User < ApplicationRecord
  has_one :tutor
  has_one :clinic
  has_one :vet

  validates :email, :password, :role, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def tutor?
    self.role == 'tutor'
  end

  def clinic?
    self.role == 'clinic'
  end

  def vet?
    self.role == 'vet'
  end
end
