class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.date :date_of_birth
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
