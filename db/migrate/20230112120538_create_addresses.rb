class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :patient, null: false, index: true, foreign_key: true
      t.string :city, null: false
      t.string :street, null: false
      t.string :house, null: false
      t.integer :flat

      t.timestamps
    end
  end
end
