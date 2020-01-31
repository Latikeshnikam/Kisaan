class RentsController < ApplicationController
  def index
    @adds  = Rent.all
  end

  def show
    @shows = Rent.find(params[:id])
  end

  def new
  end

  def create
    @rents = Rent.create(permit_param)
    @instrumentid = FarmerInstrument.find(@rents.farmer_instrument_id)
    @instrumentid.update(is_available: false)
    redirect_to farmer_instruments_path
  end

  def edit
    @val = Rent.find(param[:id])
  end

  def update

  end


  private

  def permit_param
    params.require(:rent).permit(:farmer_instrument_id,:farmer_id, :from, :to)
  end

end
