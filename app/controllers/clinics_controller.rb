class ClinicsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	def index
		@clinics = Clinic.all.sort
		@clinics = if !params[:q].blank?
      Clinic.where("name LIKE ?", "%#{params[:q]}%")
    else
      
      puts "Showing all Clinics"
      Clinic.all
    end
	end	

	def new
		@clinic = Clinic.new
	end

	def show
		@clinic = Clinic.find params[:id]
		# @patients = @clinic.patients
	end

	def edit
		@clinic = Clinic.find params[:id]
	end
	
	def update
		@clinic = Clinic.find params[:id]
		@clinic.update_attributes clinic_params
		redirect_to clinics_path
	end	

	def create
		@clinic = Clinic.create clinic_params 
		redirect_to clinics_path
	end	

	def destroy
		@clinic = Clinic.find params[:id]
		@clinic.delete
		redirect_to clinics_path
	end	

private
	def clinic_params
		params.require(:clinic).permit(
			:name,
			:facility_type,
			:address,
			:city,
			:state,
			:photo
			)
	end		
end
