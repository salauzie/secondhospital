require 'rails_helper'

describe 'create new clinic' do 
	it 'should create a new patient successfully' do
		visit new_clinic_path
		fill_in 'Name', with: 'test'
		fill_in 'Facility type', with: 'test'
		fill_in 'Address', with: 'test'
		fill_in 'City', with: 'test'
		fill_in 'State', with: 'test'
		click_button 'Create Clinic'
	end	
end	