FactoryBot.define do
	factory :instrument do
		instrument_name {Faker::Vehicle.make_and_model}
		brand {Faker::Vehicle.make}
		specification {Faker::Vehicle.standard_specs}
	end
end