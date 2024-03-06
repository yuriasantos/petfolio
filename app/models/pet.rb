class Pet < ApplicationRecord
  belongs_to :tutor
  has_many :appointments
end
