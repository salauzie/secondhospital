require 'rails_helper'

describe Clinic do
	it "should have a valid factory" do
		expect(FactoryGirl.create(:clinic)).to be_valid
	end	
end