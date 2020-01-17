class FarmerInstrument < ApplicationRecord
	belongs_to :farmer
	belongs_to :instrument
	has_many :rents
end
