class Tutor < ApplicationRecord
  belongs_to :user
  has_many :pets
  has_many :appointments, through: :pets
  has_one_attached :photo

  validates :fullname, :address, presence: true
end
