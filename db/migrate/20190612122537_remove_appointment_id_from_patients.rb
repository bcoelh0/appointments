class RemoveAppointmentIdFromPatients < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :appointment_id
  end
end
