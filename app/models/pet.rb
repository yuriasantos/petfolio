class Pet < ApplicationRecord
  belongs_to :tutor
  has_many :appointments
  has_many :records, through: :appointments
  has_one_attached :photo
end
