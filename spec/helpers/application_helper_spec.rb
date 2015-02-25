require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
	it 'should return the active link' do
		params[:controller] = 'home'
		expect(helper.active_link("home")).to eq(:active)
	end

	it 'should return the active link' do
		params[:controller] = 'clinics'
		expect(helper.active_link("home")).not_to eq(:active)
	end	


end