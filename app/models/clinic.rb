class Clinic < ApplicationRecord
  belongs_to :user
  has_many :vets
end
