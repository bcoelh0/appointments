json.extract! patient, :id, :name, :email, :phone_number, :address, :notes, :appointment_id, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
