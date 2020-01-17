class Instrument < ApplicationRecord
	has_many :farmer_instruments
	has_many :farmer, :through => :farmer_instruments

end
