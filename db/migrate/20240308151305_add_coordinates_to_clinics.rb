class AddCoordinatesToClinics < ActiveRecord::Migration[7.1]
  def change
    add_column :clinics, :latitude, :float
    add_column :clinics, :longitude, :float
  end
end
