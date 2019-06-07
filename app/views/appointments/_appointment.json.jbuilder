json.extract! appointment, :id, :title, :description, :booked_time, :address, :notes, :user_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
