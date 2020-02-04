class InstrumentsController < ApplicationController
  def index
		@adds = Instrument.all
	end

	def show
		@shows = Instrument.find(params[:id])
	end

	def new

	end

	def create
		@advertise = Instrument.create(permit_param)
    params[:instrument][:instrument_id] = @advertise.id

    @val = FarmerInstrument.create(permit_param_for_advertisements)
    pp @val
    redirect_to edit_farmer_instrument_path(@val)
	end

	def edit
		@edit_form = Instrument.find(params[:id])
	end

	def update
    @update_form = Instrument.find(params[:id])
    @update_form.update(instrument_name: params[:instrument][:instrument_name], brand: params[:instrument][:brand], specification: params[:instrument][:specification],image: params[:instrument][:image])
    redirect_to instrument_path(@update_form)
  end

	private

	def permit_param
		params.require(:instrument).permit(:instrument_name, :brand, :specification, :image)
	end

  def permit_param_for_advertisements
		params.require(:instrument).permit(:farmer_id, :instrument_id)
	end

end
