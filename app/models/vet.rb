class Vet < ApplicationRecord
  belongs_to :user
  belongs_to :clinic

  SPECIALTIES = ["dermatology", "oncology", "ophthalmology", "clinical pathology"]
end
