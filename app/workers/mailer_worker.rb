class MailerWorker
  include Sidekiq::Worker

  def perform(appointment, patient)
    AppointmentAlertMailer.with(appointment: appointment, patient: patient)
      .appointment_alert_email.deliver_now
  end
end
