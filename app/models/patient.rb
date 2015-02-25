class Patient < ActiveRecord::Base

belongs_to :clinic
has_many :medications, through: :patient_medications
has_many :patient_medications
has_many :doctors, through: :patient_doctors
has_many :patient_doctors

include Workflow
workflow do
	state :waiting do
		event :wait, :transitions_to => :waiting
		event :check_up, :transitions_to => :checking_up
		event :x_ray, :transitions_to => :x_raying
		event :surge, :transitions_to => :surgery
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end

	state :checking_up do
		event :check_up, :transitions_to => :checking_up
		event :x_ray, :transitions_to => :x_raying
		event :surge, :transitions_to => :surgery
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end

	state :x_raying do
		event :x_ray, :transitions_to => :x_raying
		event :surge, :transitions_to => :surgery
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end	

	state :surgery do
		event :surge, :transitions_to => :surgery
		event :bills, :transitions_to => :billing
	end

	state :billing do
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end	

	state :leaving do
		event :leave, :transitions_to => :leaving
	end	
end

	BLOOD_TYPE_OPTIONS = [
		"A+",
		"A-",
		"B+",
		"B-",
		"O+",
		"O-",
		"AB+",
		"AB-"
	]
end
