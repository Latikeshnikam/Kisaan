FactoryBot.define do
	factory :farmer_instrument do
		rent_per_hour {Faker::Number.number(digits: 3)}
		is_available {Faker::Boolean.boolean}
		deposit {Faker::Number.number(digits: 3)}
		available_from {Faker::Date.forward(days: 23)}
		available_to {Faker::Date.backward(days: 14)}
	end
end