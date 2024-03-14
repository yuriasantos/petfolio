class Pet < ApplicationRecord
  belongs_to :tutor
  has_many :appointments
  has_one_attached :photo

  def medical_history
    appointments.map(&:record)
  end
end
