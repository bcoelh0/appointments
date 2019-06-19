class AppointmentAlertMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def appointment_alert_email
    @patient = params[:patient]
    @appointment = params[:appointment]
    mail(to: @patient.email, subject: "Upcomming Appointment!")
  end
end
