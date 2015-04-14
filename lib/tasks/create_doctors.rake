task create_doctors: :environment do
	100.times do
		Doctor.create!({
			name: "#{Faker::Name.name}",
			phone_number: "#{Faker::PhoneNumber.phone_number}",
			specialty: "Primary",
			photo: "#{Faker::Avatar.image}"
		})
	end	
end
