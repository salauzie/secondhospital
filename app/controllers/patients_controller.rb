class PatientsController < ApplicationController
	before_action :set_patient, only: [
	:show,
	:edit,
	:update,
	:destroy,
	:wait_patient,
	:check_up_patient,
	:x_ray_patient,
	:surgery_patient,
	:bills_patient,
	:leave_patient
	]


	def index
		@clinic = Clinic.find params[:clinic_id]
		@patients = @clinic.patients
	end	

	def new
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.new
		@doctors = Doctor.all
		@medications = Medication.all
	end

	def show
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.find params[:id]
		@doctors = @patient.doctors
		@medications = @patient.medications
	end

	def edit
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.find params[:id]
		@doctors = Doctor.all
		@medications = Medication.all
	end
	
	def update
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.find params[:id]
		@patient.update_attributes patient_params
		@doctors = @patient.doctors
		@medications = @patient.medications
		redirect_to clinic_patients_path
	end	

	def create
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.create patient_params
		@doctors = @patient.doctors
		@medications = @patient.medications
		redirect_to clinic_patients_path
	end	

	def destroy
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.find params[:id]
		@patient.delete
		redirect_to clinic_patients_path
	end	

	def wait_patient
 		set_patient
    @patient.wait!
    redirect_to clinic_patients_path
  end

  def checkup_patient
  	set_patient
    @patient.check_up!
    redirect_to clinic_patients_path
  end

  def xray_patient
  	set_patient
    @patient.x_ray!
    redirect_to clinic_patients_path
  end

  def surgery_patient
  	set_patient
    @patient.surge!
    redirect_to clinic_patients_path
  end

  def bills_patient
  	set_patient
    @patient.bills!
    redirect_to clinic_patients_path
  end

  def leave_patient
  	set_patient
    @patient.leave!
    redirect_to clinic_patients_path
  end

private
	def set_patient
		@patient = Patient.find(params[:id])
	end

	def patient_params
			params.require(:patient).permit(
			:first_name,
			:last_name,
			:date_of_birth,
			:description,
			:gender,
			:blood_type,
			:workflow_state,
			patient_ids: [],
			doctor_ids: [],
			medication_ids: []
			)
	end

end
