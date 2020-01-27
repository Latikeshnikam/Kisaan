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
		@advertise = Instrument.new(permit_param)
		@advertise.save
		redirect_to instrument_path(@advertise)
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
end
