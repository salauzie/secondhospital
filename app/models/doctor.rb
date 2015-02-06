class Doctor < ActiveRecord::Base
	belongs_to :patients
	belongs_to :clinics
	has_many :clinic_doctors
	has_many :patient_doctors
	has_many :patients, through: :patient_doctors
end
