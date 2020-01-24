require 'rails_helper'

RSpec.describe Farmer, type: :model do
	before(:each) do
		@farmer_obj = create(:farmer)
	end

	it 'should have mobile number' do
		

		#@farmer = Farmer.new(first_name: "Tejas",last_name: "Zambre",mobile_number: "9876548765",email: "tejas@gmail.com" )
		expect(@farmer_obj.valid?).to eq true
		expect(@farmer_obj.save).to eq true
	end

	it 'should have email' do
		expect(@farmer_obj.errors.include?(:email)).to eq false

	end

	it 'concatenate first name and last name' do
		expect(@farmer_obj.full_name).to eq("#{@farmer_obj.first_name} #{@farmer_obj.last_name}")
	end

	


end
