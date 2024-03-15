class RemoveVetRatingFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :vet_rating, :string
  end
end
