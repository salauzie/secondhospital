require 'rails_helper'

RSpec.describe Patient, type: :model do
	subject do
		Patient.new({
			first_name: "sue",
			last_name: "moon",
			date_of_birth: "07/18/90",
			description: "headache",
			gender: "female",
			blood_type: "O+"
			})
	end

	it "should start in the state waiting" do
		expect(subject.current_state).to eq("waiting")
	end	

	it "should be able to transfer to 6 states from opened" do
		expect(subject.current_state.events.keys).to eq([
			:wait,
			:check_up,
			:x_ray,
			:surge,
			:bills,
			:leave
		])
	end

	it "should be able to transfer to 5 states from check_up" do
		subject.save
		subject.check_up!
		expect(subject.current_state.events.keys).to eq([
			:check_up,
			:x_ray,
			:surge,
			:bills,
			:leave
		])	
	end

	it "should be able to transfer to 4 states from x_ray" do
		subject.save
		subject.x_ray!
		expect(subject.current_state.events.keys).to eq([
				:x_ray,
				:surge,
				:bills,
				:leave
			])
	end	

	it "should be able to transfer to 2 states from surgery" do
		subject.save
		subject.surge!
		expect(subject.current_state.events.keys).to eq([
				:surge,
				:bills
			])
	end

	it "should be able to transfer to 2 states from billing" do
		subject.save
		subject.bills!
		expect(subject.current_state.events.keys).to eq([
				:bills,
				:leave
			])
	end

	it "should be able to transfer to 1 states from leaving" do
		subject.save
		subject.leave!
		expect(subject.current_state.events.keys).to eq([
				:leave
			])
	end	
end	