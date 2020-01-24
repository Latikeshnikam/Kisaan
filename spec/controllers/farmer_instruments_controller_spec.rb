require 'rails_helper'

RSpec.describe FarmerInstrumentsController, type: :controller do
	it 'should render index action' do
		#Farmer.create(first_name: "Abhishek", last_name: "Sapate", mobile_number: "8765438976",email: "hsv@khgsadsjh.com")
		#Instrument.create(instrument_name: "Axe", brand: "Virat", specification: "Farming purpose")
		#@farmer_inst = FarmerInstrument.create(farmer_id: 1, instrument_id: 1, is_available: true, deposit: 450)
		
		@farmer_obj = create(:farmer)
		@instrument_obj = create(:instrument)
		@farmer_inst = create(:farmer_instrument)
		get :index
		expect(response).to have_http_status(:success)
	end

end
