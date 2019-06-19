class AppointmentsController < ApplicationController
  include ApplicationHelper
  include AppointmentsHelper
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = current_user.appointments.order("booked_time").includes(:patients)
  end

  # endpoint that feeds fullcalendar
  def index_for_calendar
    # build_calendar_data --> AppointmentsHelper method
    render json: build_calendar_data, status: 200
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = current_user.appointments.new
    @patients = current_user.patients
  end

  # GET /appointments/1/edit
  def edit
    @patients = current_user.patients
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = current_user.appointments.new(just_appointment_params)
    set_appointments_patients

    respond_to do |format|
      if @appointment.save
        send_appointment_emails!
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    set_appointments_patients
    respond_to do |format|
      if @appointment.update(just_appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:title, :description, :booked_time, :address, :notes, :user_id, patients_attributes: [:id, :_destroy])
    end

    def just_appointment_params
      appointment_params.except(:patients_attributes)
    end

    def just_patient_params
      appointment_params[:patients_attributes].values
    end

    def set_appointments_patients
      @appointment.patients = []
      just_patient_params.each do |p|
        @appointment.patients << current_user.patients.find(p[:id]) if p[:_destroy] == "false"
      end
    end

    def send_appointment_emails!
      @appointment.patients.each do |patient|
        # send email now!
        MailerWorker.perform_async(@appointment, patient)
        # send email 24 hours before appointment
        run_at = @appointment.booked_time - 24.hours
        MailerWorker.perform_at(run_at, @appointment, patient)
      end
    end
end
