class RenameTypeColumnInPets < ActiveRecord::Migration[7.1]
  def change
    rename_column :pets, :type, :species
  end
end
