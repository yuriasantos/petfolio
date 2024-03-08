class Tutor < ApplicationRecord
  belongs_to :user
  has_many :pets
  has_many :appointments, through: :pets

  validates :fullname, :address, presence: true
end
