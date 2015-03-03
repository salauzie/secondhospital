require 'rails_helper'

describe ClinicsController do
	describe "GET #index" do
	# @clinics = Clinic.all
	# 	@clinics = if !params[:q].blank?
 #      Clinic.where("name LIKE ?", "%#{params[:q]}%")
 #    else
      
 #      puts "Showing all Clinics"
 #      Clinic.all
 #    end
 		it "displays all"
 		it "searches"
 	end	

 	describe "GET #new" do
 		it "assigns a new clinic to @clinic"
	 	end

	describe 'GET #show' do
		it "assigns requested clinic to @clinic"
	end

	describe 'POST #create' do
		it "saves the clinic to the database"
		it "redirects to clinics index"
	end	

end		