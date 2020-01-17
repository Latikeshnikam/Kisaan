class Rent < ApplicationRecord
	
	belongs_to :farmer_instrument
	belongs_to :farmer
end
