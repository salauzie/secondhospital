class MedicationsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@medications = Medication.all
		@medications = if !params[:q].blank?
    Medication.where("name LIKE ?", "%#{params[:q]}%")
  else
    puts "Showing all Medications"
    Medication.all
  end
	end	

	def new
		@medication = Medication.new
	end

	def edit
		@medication = Medication.find params[:id]
	end
	
	def update
		@medication = Medication.find params[:id]
		@medication.update_attributes medication_params
		redirect_to medications_path
	end	

	def create
		@medication = Medication.create medication_params
		redirect_to medications_path
	end

	def destroy
		@medication = Medication.find params[:id]
		@medication.delete
		redirect_to medications_path
	end

private
	def medication_params
		params.require(:medication).permit(
			:name,
			:strength,
			:directions,
			:prescriber
			)
	end	
end
