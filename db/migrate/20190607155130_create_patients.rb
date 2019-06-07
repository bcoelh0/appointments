class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.text :notes
      t.integer :appointment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
