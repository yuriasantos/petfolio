class Pet < ApplicationRecord
  SPECIES = ['cat', 'dog', 'hamster', 'rabbit', 'bird', 'other']

  belongs_to :tutor
  has_many :appointments
  has_many :records, through: :appointments
  has_one_attached :photo

  validates :species, inclusion: { in: SPECIES }
end
