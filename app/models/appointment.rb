class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :pet
  has_one :record
  has_one :review

  validates :datetime, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :datetime ],
  associated_against: {
    pet: [ :name ],
    vet: [:fullname]
  },
  using: {
    tsearch: { prefix: true}
  }

  def date_in_past?
    datetime.to_date <= Date.today
  end

end
