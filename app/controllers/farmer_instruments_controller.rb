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
		# pp permit_param
		@advertise = FarmerInstrument.new(permit_param)
		@advertise.save
		redirect_to farmer_instrument_path(@advertise)
	end

	def edit
		@edit_form = FarmerInstrument.find(params[:id])
	end

	def update
			if (params[:flg])
				@current= FarmerInstrument.find(params[:id])
				#authorize @current
				@current.update(is_available: true)
				redirect_to farmer_instruments_path
			else
	    	@update_form = FarmerInstrument.find(params[:id])

	    	@update_form.update(rent_per_hour: params[:farmer_instrument][:rent_per_hour],deposit: params[:farmer_instrument][:deposit],is_available: params[:farmer_instrument][:is_available],available_from: params[:farmer_instrument][:available_from],available_to: params[:farmer_instrument][:available_to])
	    	redirect_to farmer_instrument_path(@update_form	)
		end
  end
    def destroy
    	@find = FarmerInstrument.find(params[:id])
    	@find.destroy

    	redirect_to farmer_instruments_path
    end


	private

	def permit_param
		params.require(:farmer_instrument).permit(:farmer_id, :instrument_id, :rent_per_hour, :deposit, :is_available, :available_from, :available_to)
	end

end
