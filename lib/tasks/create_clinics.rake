task create_clinics: :environment do
	100.times do
		Clinic.create!({
			name: "#{Faker::Company.name}",
			facility_type: "Clinic",
			address: "#{Faker::Address.street_address}",
			city: "#{Faker::Address.city}",
			state: "#{Faker::Address.state_abbr}",
			photo: "http://placekitten.com/g/200/300"
		})
	end	
end