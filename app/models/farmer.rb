class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
extend Devise::Models
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
      #   :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  validates :mobile_number, length: { is: 10}, uniqueness: true
  VALID_EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_one :address
  has_many :farmer_instruments
  has_many :instruments, :through => :farmer_instruments

  has_many :rents#, foreign_key: 'borrower_id'
  has_many :rented_instruments, :through => :rents, class_name: 'Rent', foreign_key: 'farmer_instrument_id'


  before_save :titleize_names


  def titleize_names
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
  end

  def full_name
    self.first_name.to_s + ' '+ self.last_name.to_s
  end

end
