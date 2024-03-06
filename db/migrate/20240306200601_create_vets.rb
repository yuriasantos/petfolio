class CreateVets < ActiveRecord::Migration[7.1]
  def change
    create_table :vets do |t|
      t.string :fullname
      t.string :crmv
      t.string :specialty
      t.references :user, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
