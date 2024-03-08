class Clinic < ApplicationRecord
  belongs_to :user
  has_many :vets
  has_many :appointments, through: :vets

  validates :cnpj, :company_name, :address, presence: true

  validates :cnpj, numericality: { only_integer: true }, length: {is: 14}
end
