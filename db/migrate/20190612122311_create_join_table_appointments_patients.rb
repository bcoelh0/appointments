class CreateJoinTableAppointmentsPatients < ActiveRecord::Migration[5.2]
  def change
    create_join_table :appointments, :patients do |t|
      t.index [:appointment_id, :patient_id]
      t.index [:patient_id, :appointment_id]
    end
  end
end
