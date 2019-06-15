module AppointmentsHelper
  def build_calendar_data
    appointments = current_user.appointments.order "booked_time"
    appointments_for_calendar = []
    appointments.each do |appointment|
      appointment_for_calendar = {}
      appointment_for_calendar[:title] = appointment.title + (appointment.patients.first.present? ? " - #{appointment.patients.first.name}" : "")
      appointment_for_calendar[:start] = appointment.booked_time
      appointment_for_calendar[:end] = appointment.booked_time + 1.hour
      appointment_for_calendar[:url] = appointment_url(appointment)
      appointments_for_calendar << appointment_for_calendar
    end
    appointments_for_calendar
  end
end
