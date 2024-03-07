class CreateClinics < ActiveRecord::Migration[7.1]
  def change
    create_table :clinics do |t|
      t.string :cnpj
      t.string :address
      t.string :company_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
