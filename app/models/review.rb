class Review < ApplicationRecord
  belongs_to :appointment

  validates :clinic_rating, :content, presence: true

end
