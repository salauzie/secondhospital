task create_patients: :environment do
	100.times do
		Patient.create!({
			first_name: "#{Faker::Name.first_name}",
			last_name: "#{Faker::Name.last_name}",
			date_of_birth: "07/18/1990",
			description: "#{Faker::Lorem.sentence}",
			gender: "Female",
			blood_type: "O-",
			clinic_id: "1",
			workflow_state: "Waiting"
		})
	end	
end