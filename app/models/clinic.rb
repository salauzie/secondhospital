class Clinic < ActiveRecord::Base

	has_many :patients, dependent: :destroy
	has_many :doctors, through: :clinic_doctors
	has_many :clinic_doctors
end
