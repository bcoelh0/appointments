class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :title
      t.text :description
      t.datetime :booked_time
      t.string :address
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
