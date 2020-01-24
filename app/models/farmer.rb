class Farmer < ApplicationRecord
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	has_many :rents
	has_one :address 
	has_many :farmer_instruments
	has_many :farmer_instruments, :through => :rents
	has_many :instruments, :through => :farmer_instruments
	has_many :rented_instruments, :through => :rents, class_name: 'Rent', foreign_key: 'farmer_instrument_id'
	before_save :titalize_name

	validates :mobile_number, length: {is: 10}, uniqueness: true

	def titalize_name
		self.first_name = self.first_name.titleize
		self.last_name = self.last_name.titleize
	end

	def full_name
		self.first_name.to_s + " " +self.last_name.to_s
	end
end

