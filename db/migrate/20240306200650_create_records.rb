class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.string :content
      t.string :exams
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
