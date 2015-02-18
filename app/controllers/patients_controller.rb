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
		# @patients = if !params[:q].blank?
  #     @clinic.patients.where("name LIKE ?", "%#{params[:q]}%")
  #   else
  #     puts "Showing all Patients"
  #     @clinic.patients.all
  #   end
  	@clinic_id = params[:clinic_id]
  	@patients = @clinic.patients
  	respond_to do |format|
  		format.js
  		format.html
  	end	
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
		if @patient.save
			flash[:notice] = 'Patient was added successfully.'
			redirect_to clinic_patients_path
		else 
		flash[:error] = 'Patient add unsuccessful.'	
		render :new
		end
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
   #  redirect_to clinic_patients_path
  	respond_to do |format|
  		format.js
  	end	
  end

  def checkup_patient
  	set_patient
    @patient.check_up!
    respond_to do |format|
  		format.js
  	end
  end

  def xray_patient
  	set_patient
    @patient.x_ray!
    respond_to do |format|
  		format.js
  	end
  end

  def surgery_patient
  	set_patient
    @patient.surge!
    respond_to do |format|
  		format.js
  	end
  end

  def bills_patient
  	set_patient
    @patient.bills!
    respond_to do |format|
  		format.js
  	end
  end

  def leave_patient
  	set_patient
    @patient.leave!
    respond_to do |format|
  		format.js
  	end
  end

def search_results
	@clinic = Clinic.find params[:clinic_id]
	@clinic_id = params[:clinic_id]
	@patients = Patient.where("first_name LIKE ? OR last_name LIKE ? OR description LIKE ? AND clinic_id = ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
	p @patients
	respond_to do |format|
		format.js
		format.html
	end
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
			clinic_ids: [],
			medication_ids: []
			)
	end

end
