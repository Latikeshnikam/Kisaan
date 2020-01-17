class FarmerInstrumentsController < ApplicationController
	def index
		@adds = FarmerInstrument.all.includes(:farmer, :instrument)
		@farm = Farmer.all.order(:first_name, :last_name)
	end

	def show
		@shows = FarmerInstrument.find(params[:id])

	end

	def new
		@farmer_list = Farmer.all.collect {|f| [ f.first_name, f.id ]}
		@instrument_list = Instrument.all.collect {|i| [ i.instrument_name, i.id ]}
	end

	def create
		@advertise = FarmerInstrument.new(permit_param)
		@advertise.save
		redirect_to farmer_instrument_path(@advertise)
	end

	private

	def permit_param
		params.require(:farmer_instrument).permit(:farmer_id, :instrument_id, :rent_per_hour, :deposit, :is_available, :available_from, :available_to)
	end
end
