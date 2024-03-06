class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.float :vet_rating
      t.float :clinic_rating
      t.text :content
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
