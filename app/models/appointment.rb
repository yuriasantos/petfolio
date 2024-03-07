class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :pet
  has_one :record
  has_one :review
end
