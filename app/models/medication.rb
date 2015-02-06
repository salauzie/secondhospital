class Medication < ActiveRecord::Base
	has_many :patient_medications
	belongs_to :patients
	has_many :patients, through: :patient_medications
end
