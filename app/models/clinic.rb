class Clinic < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [:company_name, :address],
  using: {
    tsearch: { prefix: true }
  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :vets
  has_many :appointments, through: :vets
  has_one_attached :photo

  validates :cnpj, :company_name, :address, presence: true

  validates :cnpj, numericality: { only_integer: true }, length: {is: 14}


end
