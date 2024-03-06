class CreateTutors < ActiveRecord::Migration[7.1]
  def change
    create_table :tutors do |t|
      t.string :fullname
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
