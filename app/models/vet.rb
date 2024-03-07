class Vet < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
end
