class Vet < ApplicationRecord
  belongs_to :user
  belongs_to :clinic

  SPECIALTIES = ["dermatology", "oncology", "ophthalmology", "clinical pathology"]

  validates :fullname, :crmv, :specialty, presence: true
  validate :specialty_must_be_in_list

  private

  def specialty_must_be_in_list
    unless SPECIALTIES.include?(specialty)
      errors.add(:specialty, "must be on the list.")
    end
  end
end
