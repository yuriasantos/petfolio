class Record < ApplicationRecord
  belongs_to :appointment

  validates :content, presence: true
  # validates :appointment, uniqueness: true
end
