class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :patient, null: false, index: true, foreign_key: true
      t.integer :contact_type, null: false
      t.string :contact_value, null: false
      t.timestamps
    end
  end
end
